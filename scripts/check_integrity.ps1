[CmdletBinding()]
param()

$ErrorActionPreference = 'Stop'
$repoRoot = (Resolve-Path (Join-Path $PSScriptRoot '..')).Path
$failures = [System.Collections.Generic.List[string]]::new()

function Add-Failure([string]$Message) {
    $failures.Add($Message)
}

function Get-RelativePath([string]$Path) {
    $baseUri = [Uri]::new(($repoRoot.TrimEnd([System.IO.Path]::DirectorySeparatorChar) + [System.IO.Path]::DirectorySeparatorChar))
    $pathUri = [Uri]::new($Path)
    return [Uri]::UnescapeDataString($baseUri.MakeRelativeUri($pathUri).ToString()).Replace('/', [System.IO.Path]::DirectorySeparatorChar)
}

function Get-GitHubSlug([string]$Heading) {
    $slug = $Heading.Trim().ToLowerInvariant()
    $slug = [regex]::Replace($slug, '[^\p{L}\p{Nd}_\- ]', '')
    return ($slug -replace ' ', '-')
}

function Remove-FencedCodeBlocks([string]$Content) {
    return [regex]::Replace($Content, '(?ms)^[ \t]*(?<fence>`{3,}|~{3,})[^\r\n]*\r?\n.*?^[ \t]*\k<fence>[ \t]*$', '')
}

function Trim-BlankEdges([string[]]$Lines) {
    $list = [System.Collections.Generic.List[string]]::new()
    foreach ($line in $Lines) { $list.Add($line.TrimEnd()) }
    while ($list.Count -gt 0 -and $list[0] -eq '') { $list.RemoveAt(0) }
    while ($list.Count -gt 0 -and $list[$list.Count - 1] -eq '') { $list.RemoveAt($list.Count - 1) }
    return $list.ToArray()
}

function Normalize-PublicationBody([string[]]$Lines, [int]$HeadingShift = 0) {
    $normalized = [System.Collections.Generic.List[string]]::new()
    foreach ($line in $Lines) {
        if ($line -match '^<a id="chapter-[^"]+"></a>$') { continue }
        $value = [regex]::Replace($line, '\[([^\]]+)\]\([^)]+\)', '$1')
        if ($HeadingShift -ne 0 -and $value -match '^(#{1,5})(\s+.*)$') {
            $newLevel = $matches[1].Length + $HeadingShift
            if ($newLevel -lt 1 -or $newLevel -gt 6) {
                Add-Failure "Invalid normalized heading level: $value"
            }
            else {
                $value = ('#' * $newLevel) + $matches[2]
            }
        }
        $normalized.Add($value.TrimEnd())
    }
    return Trim-BlankEdges $normalized.ToArray()
}

function Get-StandaloneBody([string]$RelativePath, [int]$HeadingShift = 0) {
    $lines = Get-Content -Encoding utf8 -LiteralPath (Join-Path $repoRoot $RelativePath)
    if ($lines.Count -lt 2) { return @() }
    return Normalize-PublicationBody $lines[1..($lines.Count - 1)] $HeadingShift
}

function Get-CompleteChapterBody([string]$ChapterHeading, [string]$NextHeading) {
    $completePath = Join-Path $repoRoot 'AI_SDLC_DPF/AI_SDLC_DPF_COMPLETE.md'
    $lines = Get-Content -Encoding utf8 -LiteralPath $completePath
    $start = [Array]::IndexOf($lines, $ChapterHeading)
    $end = [Array]::IndexOf($lines, $NextHeading)
    if ($start -lt 0 -or $end -le $start) {
        Add-Failure "Complete publication chapter boundary missing: $ChapterHeading"
        return @()
    }
    $body = Trim-BlankEdges $lines[($start + 1)..($end - 1)]
    if ($body.Count -gt 0 -and $body[0] -match '^> \*\*Authority status:') {
        if ($body.Count -eq 1) { return @() }
        $body = Trim-BlankEdges $body[1..($body.Count - 1)]
    }
    return Normalize-PublicationBody $body
}

function Get-CompleteLastChapterBody([string]$ChapterHeading) {
    $completePath = Join-Path $repoRoot 'AI_SDLC_DPF/AI_SDLC_DPF_COMPLETE.md'
    $lines = Get-Content -Encoding utf8 -LiteralPath $completePath
    $start = [Array]::IndexOf($lines, $ChapterHeading)
    if ($start -lt 0) {
        Add-Failure "Complete publication chapter missing: $ChapterHeading"
        return @()
    }
    $body = Trim-BlankEdges $lines[($start + 1)..($lines.Count - 1)]
    if ($body.Count -gt 0 -and $body[0] -match '^> \*\*Authority status:') {
        if ($body.Count -eq 1) { return @() }
        $body = Trim-BlankEdges $body[1..($body.Count - 1)]
    }
    return Normalize-PublicationBody $body
}

function Get-CompleteSectionBody([string]$SectionHeading, [string]$EndMarker) {
    $completePath = Join-Path $repoRoot 'AI_SDLC_DPF/AI_SDLC_DPF_COMPLETE.md'
    $lines = Get-Content -Encoding utf8 -LiteralPath $completePath
    $start = [Array]::IndexOf($lines, $SectionHeading)
    $end = [Array]::IndexOf($lines, $EndMarker)
    if ($start -lt 0 -or $end -le $start) {
        Add-Failure "Complete publication section boundary missing: $SectionHeading"
        return @()
    }
    return Normalize-PublicationBody (Trim-BlankEdges $lines[($start + 1)..($end - 1)])
}

Write-Output "Integrity check root: $repoRoot"

# UTF-8 validity
$textFiles = Get-ChildItem -LiteralPath $repoRoot -Recurse -File | Where-Object {
    $_.Extension -in @('.md', '.ps1', '.yaml', '.yml') -or $_.Name -in @('.gitattributes', 'LICENSE')
}
foreach ($file in $textFiles) {
    try {
        $bytes = [System.IO.File]::ReadAllBytes($file.FullName)
        [void][System.Text.UTF8Encoding]::new($false, $true).GetString($bytes)
    }
    catch {
        Add-Failure "Invalid UTF-8: $(Get-RelativePath $file.FullName)"
    }
}

# Local Markdown links and fragments
$markdownFiles = Get-ChildItem -LiteralPath $repoRoot -Recurse -File -Filter '*.md'
$anchorCache = @{}
foreach ($file in $markdownFiles) {
    $content = Get-Content -Raw -Encoding utf8 -LiteralPath $file.FullName
    $liveContent = Remove-FencedCodeBlocks $content
    foreach ($match in [regex]::Matches($liveContent, '\[[^\]]+\]\(([^)]+)\)')) {
        $target = $match.Groups[1].Value.Trim()
        if ($target -match '^(https?://|mailto:)') { continue }
        $parts = $target -split '#', 2
        try {
            $localPart = $parts[0]
            if ($localPart.StartsWith('<') -and $localPart.EndsWith('>')) {
                $localPart = $localPart.Substring(1, $localPart.Length - 2)
            }
            $targetPath = if ($localPart) {
                [System.IO.Path]::GetFullPath((Join-Path $file.DirectoryName ([Uri]::UnescapeDataString($localPart))))
            }
            else {
                $file.FullName
            }
        }
        catch {
            Add-Failure "Invalid Markdown target: $(Get-RelativePath $file.FullName) -> $target"
            continue
        }
        if (-not (Test-Path -LiteralPath $targetPath -PathType Leaf)) {
            Add-Failure "Missing Markdown target: $(Get-RelativePath $file.FullName) -> $target"
            continue
        }
        if ($parts.Count -eq 2 -and $parts[1]) {
            if (-not $anchorCache.ContainsKey($targetPath)) {
                $anchors = [System.Collections.Generic.HashSet[string]]::new([System.StringComparer]::OrdinalIgnoreCase)
                foreach ($line in (Get-Content -Encoding utf8 -LiteralPath $targetPath)) {
                    if ($line -match '^#{1,6}\s+(.+?)\s*$') { [void]$anchors.Add((Get-GitHubSlug $matches[1])) }
                    if ($line -match '<a\s+id="([^"]+)"') { [void]$anchors.Add($matches[1]) }
                }
                $anchorCache[$targetPath] = $anchors
            }
            if (-not $anchorCache[$targetPath].Contains($parts[1])) {
                Add-Failure "Missing Markdown anchor: $(Get-RelativePath $file.FullName) -> $target"
            }
        }
    }
}

# Required package files
$requiredFiles = @(
    '.gitattributes',
    'LICENSE',
    'README.md',
    'PACKAGE_MANIFEST.md',
    'AGENTS.md',
    'ENGINEERING_WORK_BOOTSTRAP_GUIDE.md',
    'WORKING_PROCESS_AND_LOOPS_GUIDE.md',
    'docs/DPF_FORMATION_METHOD.md',
    'docs/DPF_FORMATION_REFERENCE.md',
    'docs/KIT_EVOLUTION_ROADMAP.md',
    'docs/releases/RELEASE_NOTES_3_2_0.md',
    'tests/behavioral/BOOTSTRAP_SCENARIOS.md',
    'AI_SDLC_DPF/framework/AI_SDLC_DPF.md',
    'AI_SDLC_DPF/AI_SDLC_DPF_COMPLETE.md'
)
foreach ($relativePath in $requiredFiles) {
    if (-not (Test-Path -LiteralPath (Join-Path $repoRoot $relativePath) -PathType Leaf)) {
        Add-Failure "Required file missing: $relativePath"
    }
}

# Declared line-ending policy and byte-preserved exceptions
$attributesPath = Join-Path $repoRoot '.gitattributes'
$protectedTextExceptions = @(
    'AI_SDLC_DPF/framework/AI_SDLC_DPF.md',
    'AI_SDLC_DPF/framework/AI_SDLC_REFERENCE_ARCHITECTURE.md',
    'AI_SDLC_DPF/framework/AI_SDLC_PRIMARY_APPLICATION_PROFILE.md',
    'AI_SDLC_DPF/QUICKSTART.md'
)
if (Test-Path -LiteralPath $attributesPath -PathType Leaf) {
    $attributesText = Get-Content -Raw -Encoding utf8 -LiteralPath $attributesPath
    foreach ($requiredRule in @(
        '* text=auto',
        '*.md text eol=lf',
        '*.ps1 text eol=lf',
        '*.yaml text eol=lf',
        '*.yml text eol=lf'
    )) {
        if (-not $attributesText.Contains($requiredRule)) {
            Add-Failure "Line-ending policy rule missing: $requiredRule"
        }
    }
    $actualExceptions = @([regex]::Matches($attributesText, '(?m)^([^#\s]+)\s+-text\s*$') | ForEach-Object { $_.Groups[1].Value })
    foreach ($expectedException in $protectedTextExceptions) {
        if ($actualExceptions -notcontains $expectedException) {
            Add-Failure "Protected EOL exception missing: $expectedException"
        }
    }
    foreach ($actualException in $actualExceptions) {
        if ($protectedTextExceptions -notcontains $actualException) {
            Add-Failure "Undeclared EOL exception: $actualException"
        }
    }
}

# Forbidden operational remnants and placeholders
$operationalPaths = @('README.md', 'AGENTS.md', 'ENGINEERING_WORK_BOOTSTRAP_GUIDE.md', 'WORKING_PROCESS_AND_LOOPS_GUIDE.md')
$operationalText = ($operationalPaths | ForEach-Object { Get-Content -Raw -Encoding utf8 -LiteralPath (Join-Path $repoRoot $_) }) -join "`n"
if ($operationalText -match '(?i)use_core_v2') { Add-Failure 'Forbidden operational Entry Route remains: use_core_v2' }
foreach ($forbidden in @('AI_SDLC_DPF_SOURCES.md', '[[DPF_FORMATION_METHOD]]', 'returned for refinement')) {
    if ($operationalText.Contains($forbidden)) { Add-Failure "Forbidden or stale operational text remains: $forbidden" }
}
if ($operationalText -match 'Included DPF release:\s*<') { Add-Failure 'Unresolved included-DPF version placeholder remains' }

# Historical Quick Start boundary
$quickStartPath = Join-Path $repoRoot 'AI_SDLC_DPF/QUICKSTART.md'
if (Test-Path -LiteralPath $quickStartPath -PathType Leaf) {
    $quickStartText = Get-Content -Raw -Encoding utf8 -LiteralPath $quickStartPath
    foreach ($requiredPhrase in @(
        '**Status:** Historical / non-operational',
        '**Operational use:** Prohibited',
        '**Superseded by:**'
    )) {
        if (-not $quickStartText.Contains($requiredPhrase)) {
            Add-Failure "Historical Quick Start boundary missing: $requiredPhrase"
        }
    }
}

$activeEntryPaths = @(
    'AI_SDLC_DPF/README.md',
    'AI_SDLC_DPF/AI_SDLC_DPF_COMPLETE.md',
    'README.md',
    'AGENTS.md',
    'WORKING_PROCESS_AND_LOOPS_GUIDE.md'
)
$activeEntryText = ($activeEntryPaths | ForEach-Object { Get-Content -Raw -Encoding utf8 -LiteralPath (Join-Path $repoRoot $_) }) -join "`n"
foreach ($staleActiveInstruction in @(
    'DPF Quick Start and project materials',
    'post-Bootstrap application guidance'
)) {
    if ($activeEntryText.Contains($staleActiveInstruction)) {
        Add-Failure "Active Quick Start instruction remains: $staleActiveInstruction"
    }
}

# Version identity across controlled carriers
$manifestText = Get-Content -Raw -Encoding utf8 -LiteralPath (Join-Path $repoRoot 'PACKAGE_MANIFEST.md')
$readmeText = Get-Content -Raw -Encoding utf8 -LiteralPath (Join-Path $repoRoot 'README.md')
$bootstrapText = Get-Content -Raw -Encoding utf8 -LiteralPath (Join-Path $repoRoot 'ENGINEERING_WORK_BOOTSTRAP_GUIDE.md')
$workingGuideText = Get-Content -Raw -Encoding utf8 -LiteralPath (Join-Path $repoRoot 'WORKING_PROCESS_AND_LOOPS_GUIDE.md')
$agentsText = Get-Content -Raw -Encoding utf8 -LiteralPath (Join-Path $repoRoot 'AGENTS.md')
$roadmapText = Get-Content -Raw -Encoding utf8 -LiteralPath (Join-Path $repoRoot 'docs/KIT_EVOLUTION_ROADMAP.md')
$releaseNotesText = Get-Content -Raw -Encoding utf8 -LiteralPath (Join-Path $repoRoot 'docs/releases/RELEASE_NOTES_3_2_0.md')

# Public wrapper identity, license and provenance contract
$licensePath = Join-Path $repoRoot 'LICENSE'
if (-not (Test-Path -LiteralPath $licensePath -PathType Leaf)) {
    Add-Failure 'MIT LICENSE is missing'
}
else {
    $licenseHash = (Get-FileHash -Algorithm SHA256 -LiteralPath $licensePath).Hash
    if ($licenseHash -ne 'EF4DA070E506CD1018F449FC78BAE57537B96F797264CF56F133E411B5B611EC') {
        Add-Failure "MIT LICENSE hash mismatch: $licenseHash"
    }
}
$emDash = [char]0x2014
if (-not $readmeText.StartsWith("# Instantiatio DPF $emDash Engineering Work Runtime`n")) {
    Add-Failure 'README release-level identity is missing'
}
if (-not $manifestText.StartsWith("# Instantiatio DPF $emDash Engineering Work Runtime Package Manifest`n")) {
    Add-Failure 'Manifest release-level identity is missing'
}
foreach ($publicIdentityContract in @(
    @{ Name = 'README copyright'; Text = $readmeText; Marker = 'Copyright (c) 2026 Instantiatio DPF contributors' },
    @{ Name = 'README MIT link'; Text = $readmeText; Marker = '[MIT License](LICENSE)' },
    @{ Name = 'README canonical repository'; Text = $readmeText; Marker = 'https://github.com/aalberter/Instantiatio-DPF' },
    @{ Name = 'README FPF source'; Text = $readmeText; Marker = 'https://github.com/ailev/FPF' },
    @{ Name = 'README independent layer'; Text = $readmeText; Marker = 'independent engineering Work Kit and evolution layer' },
    @{ Name = 'README non-official boundary'; Text = $readmeText; Marker = 'not an official FPF distribution' },
    @{ Name = 'README non-affiliation boundary'; Text = $readmeText; Marker = 'no affiliation with or endorsement by the FPF authors or repository owners is claimed' },
    @{ Name = 'README no-redistribution boundary'; Text = $readmeText; Marker = 'No files from the external FPF repository are included or relicensed by this distribution' },
    @{ Name = 'README protected identity'; Text = $readmeText; Marker = 'does not rename or generalize the controlled `AI_SDLC_DPF/**` payload' }
)) {
    if (-not $publicIdentityContract.Text.Contains($publicIdentityContract.Marker)) {
        Add-Failure "$($publicIdentityContract.Name) missing"
    }
}
$wrapperIdentityText = @(
    $readmeText,
    $manifestText,
    $roadmapText,
    (Get-Content -Raw -Encoding utf8 -LiteralPath (Join-Path $repoRoot 'MODEL_SELECTION_RECOMMENDATIONS.md'))
) -join "`n"
$oldFullWrapperIdentity = 'AI SDLC DPF' + ' Engineering Work Kit'
if ($wrapperIdentityText.Contains($oldFullWrapperIdentity)) {
    Add-Failure 'Old full wrapper identity remains in a release-level carrier'
}
$agentEntryFiles = @(Get-ChildItem -LiteralPath $repoRoot -Recurse -File -Filter 'AGENTS.md' | Where-Object {
    -not (Get-RelativePath $_.FullName).Replace('\', '/').StartsWith('project/')
})
if ($agentEntryFiles.Count -ne 1 -or $agentEntryFiles[0].FullName -cne (Join-Path $repoRoot 'AGENTS.md')) {
    Add-Failure "Authoritative agent entry count/location mismatch: $($agentEntryFiles.Count)"
}

$versionContracts = @(
    @{ Component = 'Engineering Work Runtime'; Carrier = $readmeText; Label = 'Runtime version' },
    @{ Component = 'Bootstrap Guide'; Carrier = $bootstrapText; Label = 'Version' },
    @{ Component = 'Working Process Guide'; Carrier = $workingGuideText; Label = 'Version' },
    @{ Component = 'AGENTS dispatcher'; Carrier = $agentsText; Label = 'Version' }
)
$runtimeVersion = $null
foreach ($contract in $versionContracts) {
    $componentPattern = '\| ' + [regex]::Escape($contract.Component) + ' \| \x60([^\x60]+)\x60 \|'
    if ($manifestText -notmatch $componentPattern) {
        Add-Failure "Manifest component version is missing: $($contract.Component)"
        continue
    }
    $componentVersion = $matches[1]
    if ($contract.Component -eq 'Engineering Work Runtime') { $runtimeVersion = $componentVersion }
    $carrierPattern = [regex]::Escape($contract.Label) + ': \x60' + [regex]::Escape($componentVersion) + '\x60'
    if ($contract.Carrier -notmatch $carrierPattern) {
        Add-Failure "Component version drift: $($contract.Component) $componentVersion"
    }
    $roadmapPattern = '\| ' + [regex]::Escape($contract.Component) + ' \| \x60' + [regex]::Escape($componentVersion) + '\x60 \|'
    if ($roadmapText -notmatch $roadmapPattern) {
        Add-Failure "Roadmap component version drift: $($contract.Component) $componentVersion"
    }
}

$dpfText = Get-Content -Raw -Encoding utf8 -LiteralPath (Join-Path $repoRoot 'AI_SDLC_DPF/framework/AI_SDLC_DPF.md')
if ($manifestText -notmatch '\| AI SDLC DPF \| \x60([^\x60]+)\x60 \| controlled working \|') {
    Add-Failure 'Manifest DPF semantic version is missing'
}
else {
    $dpfVersion = $matches[1]
    $dpfVersionPattern = '\| Semantic version \| \x60' + [regex]::Escape($dpfVersion) + '\x60 \|'
    if ($dpfText -notmatch $dpfVersionPattern) {
        Add-Failure "DPF semantic version does not match manifest: $dpfVersion"
    }
    $dpfReadmeText = Get-Content -Raw -Encoding utf8 -LiteralPath (Join-Path $repoRoot 'AI_SDLC_DPF/README.md')
    $completeText = Get-Content -Raw -Encoding utf8 -LiteralPath (Join-Path $repoRoot 'AI_SDLC_DPF/AI_SDLC_DPF_COMPLETE.md')
    if (-not $dpfReadmeText.Contains("AI SDLC DPF $dpfVersion")) { Add-Failure 'DPF README version drift' }
    if (-not $completeText.Contains("AI SDLC DPF $dpfVersion Working Release")) { Add-Failure 'Combined DPF version drift' }
    if ($manifestText -notmatch '\| Included DPF assembly provenance \| \x60([^\x60]+)\x60 \|') {
        Add-Failure 'Manifest DPF assembly provenance is missing'
    }
    elseif (-not $dpfReadmeText.Contains("Work Kit/reference-package assembly: **$($matches[1])**")) {
        Add-Failure 'DPF README assembly provenance drift'
    }
}

# Package status and accepted limitation visibility
if ($manifestText -notmatch '\| Publication status \| \x60released\x60 \|') {
    Add-Failure 'Manifest publication status must be released in the release configuration'
}
foreach ($releasedStatusContract in @(
    @{ Name = 'README'; Text = $readmeText; Marker = ('> Runtime version: `3.2.0` ' + $emDash + ' `released`; predecessor released baseline remains Engineering Work Kit `3.1.0`') },
    @{ Name = 'Manifest component'; Text = $manifestText; Marker = '| Engineering Work Runtime | `3.2.0` | released |' },
    @{ Name = 'Roadmap'; Text = $roadmapText; Marker = '| Engineering Work Runtime | `3.2.0` | released |' },
    @{ Name = 'Release notes'; Text = $releaseNotesText; Marker = 'Publication status: `released`' }
)) {
    if (-not $releasedStatusContract.Text.Contains($releasedStatusContract.Marker)) {
        Add-Failure "Released status contract mismatch: $($releasedStatusContract.Name)"
    }
}
foreach ($requiredReleasePhrase in @(
    '## Known accepted release limitation',
    'ISO/IEC/IEEE DIS 29148 Ed.3',
    'stage `40.00`',
    'accepted_non_blocking'
)) {
    if (-not $manifestText.Contains($requiredReleasePhrase)) {
        Add-Failure "Released package limitation guard missing: $requiredReleasePhrase"
    }
}

# Runtime 3.2.0 released release-note contract
foreach ($releaseNoteMarker in @(
    "# Instantiatio DPF $emDash Engineering Work Runtime 3.2.0",
    'Publication status: `released`',
    "## S-01 $emDash Identity, onboarding and interaction",
    "## S-02 $emDash Bounded authority and external methods",
    "## S-03 $emDash Engineering views",
    "## S-04 $emDash Working Process compositions",
    '## Compatibility and migration',
    '## Authority, security and privacy',
    '## Verification evidence',
    '## Known limitations',
    '## Rollback and recovery',
    '## Release Admission and distribution handoff',
    'not_performed_non_blocking_limitation',
    '9E1689A3845ECCA5F70EBA55CA5F99AC09FA80640A7E6B4EE791650396931E21'
    'A5478A6515CF1932C0043355D16D29FCD5D47EAFF360F9C17240054117E6AB52'
    '877E00A73BBC425F219BCC9DA2C3B4398D730C83A2DDCBF24CA816CF8F3188F8'
    'pass_with_nonblocking_limitations'
)) {
    if (-not $releaseNotesText.Contains($releaseNoteMarker)) {
        Add-Failure "Release notes contract gap: $releaseNoteMarker"
    }
}

# Compact dispatcher contract
$agentsPath = Join-Path $repoRoot 'AGENTS.md'
$agentLines = Get-Content -Encoding utf8 -LiteralPath $agentsPath
if ($agentLines.Count -gt 180) { Add-Failure "AGENTS.md is not compact: $($agentLines.Count) lines" }
foreach ($requiredPhrase in @(
    'ENGINEERING_WORK_BOOTSTRAP_GUIDE.md',
    'WORKING_PROCESS_AND_LOOPS_GUIDE.md',
    'create_specialized_working_process',
    'Confidence, explanation',
    'read-only',
    'historical, non-operational',
    'interaction_mode',
    'explanation_mode',
    'standard + milestone'
    'explicit disposition'
)) {
    if (-not (($agentLines -join "`n").Contains($requiredPhrase))) {
        Add-Failure "AGENTS dispatcher guardrail missing: $requiredPhrase"
    }
}

# Product Engineering Composition semantic contract
$referenceProcessText = Get-Content -Raw -Encoding utf8 -LiteralPath (Join-Path $repoRoot 'AI_SDLC_DPF/framework/AI_SDLC_REFERENCE_PROCESS.md')
$applicationGuideText = Get-Content -Raw -Encoding utf8 -LiteralPath (Join-Path $repoRoot 'AI_SDLC_DPF/framework/AI_SDLC_APPLICATION_GUIDE.md')
$pecContractText = @($referenceProcessText, $applicationGuideText, $workingGuideText, $bootstrapText, $agentsText) -join "`n"
foreach ($requiredPecPhrase in @(
    'Product Engineering Composition',
    'Concern/Result Disposition Contract',
    'PEC-G01 Process Coverage',
    'PEC-G03 Data-State-Persistence',
    'PEC-G04 Relied-on Data Migration',
    'PEC-G05 Integration and System Property',
    'disposable_synthetic',
    'production_or_externally_valued',
    'smallest responsible result'
)) {
    if (-not $pecContractText.Contains($requiredPecPhrase)) {
        Add-Failure "PEC semantic contract gap: $requiredPecPhrase"
    }
}

# Operational coverage-first projection must be present in each responsible locus.
foreach ($wpcId in 1..9) {
    $id = 'WPC-{0:D2}' -f $wpcId
    if (-not $workingGuideText.Contains($id)) {
        Add-Failure "Working Process Guide coverage-first contract missing: $id"
    }
}
foreach ($mapping in @(
    @{ Name = 'Bootstrap Guide'; Text = $bootstrapText; Markers = @('WPC-01', 'WPC-06', 'WPC-07', 'FC-13', 'Required Decision') },
    @{ Name = 'AGENTS dispatcher'; Text = $agentsText; Markers = @('WPC-01', 'WPC-03', 'WPC-06', 'WPC-07', 'WPC-08', 'WPC-09', 'FC-13', 'Required Decision', 'project-relevant Candidate coverage map') },
    @{ Name = 'README navigation'; Text = $readmeText; Markers = @('FC-13-first operational entry', 'admitted context -> FC-13 -> project-relevant result expansion -> optional PEC screen -> explicit reductions -> Human decision') },
    @{ Name = 'Working Process carrier'; Text = $workingGuideText; Markers = @('admitted reduction trace', 'WPC-06 decision wrapper required', 'Admission Request and Candidate Configuration') }
)) {
    foreach ($marker in $mapping.Markers) {
        if (-not $mapping.Text.Contains($marker)) {
            Add-Failure "$($mapping.Name) coverage-first mapping missing: $marker"
        }
    }
}

# DPF pattern corpus
$dpfLines = Get-Content -Encoding utf8 -LiteralPath (Join-Path $repoRoot 'AI_SDLC_DPF/framework/AI_SDLC_DPF.md')
$patternHeadings = @($dpfLines | Select-String '^## FC-[0-9]{2} - ')
$endSentinels = @($dpfLines | Select-String '^### FC-[0-9]{2}:End$')
if ($patternHeadings.Count -ne 10) { Add-Failure "DPF pattern heading count is $($patternHeadings.Count), expected 10" }
if ($endSentinels.Count -ne 10) { Add-Failure "DPF end-sentinel count is $($endSentinels.Count), expected 10" }

# Standalone versus combined publication parity
$publicationPairs = @(
    @{ Path = 'AI_SDLC_DPF/framework/AI_SDLC_DPF.md'; Chapter = '# 4. AI SDLC DPF'; Next = '# 5. Reference Architecture' },
    @{ Path = 'AI_SDLC_DPF/framework/AI_SDLC_REFERENCE_ARCHITECTURE.md'; Chapter = '# 5. Reference Architecture'; Next = '# 6. Reference Process' },
    @{ Path = 'AI_SDLC_DPF/framework/AI_SDLC_REFERENCE_PROCESS.md'; Chapter = '# 6. Reference Process'; Next = '# 7. Primary Application Profile' },
    @{ Path = 'AI_SDLC_DPF/framework/AI_SDLC_PRIMARY_APPLICATION_PROFILE.md'; Chapter = '# 7. Primary Application Profile'; Next = '# 8. Application Guide' },
    @{ Path = 'AI_SDLC_DPF/framework/AI_SDLC_APPLICATION_GUIDE.md'; Chapter = '# 8. Application Guide'; Next = '# 9. Glossary' },
    @{ Path = 'AI_SDLC_DPF/reference/AI_SDLC_GLOSSARY.md'; Chapter = '# 9. Glossary'; Next = '# 10. Worked Examples' },
    @{ Path = 'AI_SDLC_DPF/examples/AI_SDLC_WORKED_EXAMPLES.md'; Chapter = '# 10. Worked Examples'; Next = '# 11. Sources and maintenance' }
)
foreach ($pair in $publicationPairs) {
    $standalone = Get-StandaloneBody $pair.Path
    $combined = Get-CompleteChapterBody $pair.Chapter $pair.Next
    if (($standalone -join "`n") -cne ($combined -join "`n")) {
        Add-Failure "Combined publication drift: $($pair.Path)"
    }
}

$openQuestionsStandalone = Get-StandaloneBody 'AI_SDLC_DPF/reference/AI_SDLC_OPEN_QUESTIONS.md'
$openQuestionsCombined = Get-CompleteLastChapterBody '# 12. Open Questions'
if (($openQuestionsStandalone -join "`n") -cne ($openQuestionsCombined -join "`n")) {
    Add-Failure 'Combined publication drift: AI_SDLC_DPF/reference/AI_SDLC_OPEN_QUESTIONS.md'
}

$sourcesStandalone = Get-StandaloneBody 'AI_SDLC_DPF/reference/AI_SDLC_SOURCES.md' 1
$sourcesCombined = Get-CompleteSectionBody '## Source register' '<a id="chapter-11-maintenance-governance"></a>'
if (($sourcesStandalone -join "`n") -cne ($sourcesCombined -join "`n")) {
    Add-Failure 'Combined publication drift: AI_SDLC_DPF/reference/AI_SDLC_SOURCES.md'
}

$governanceStandalone = Get-StandaloneBody 'AI_SDLC_DPF/reference/AI_SDLC_GOVERNANCE.md' 1
$governanceCombined = Get-CompleteSectionBody '## Maintenance governance' '<a id="chapter-12"></a>'
if (($governanceStandalone -join "`n") -cne ($governanceCombined -join "`n")) {
    Add-Failure 'Combined publication drift: AI_SDLC_DPF/reference/AI_SDLC_GOVERNANCE.md'
}

# Behavioral contract coverage
$scenarioPath = Join-Path $repoRoot 'tests/behavioral/BOOTSTRAP_SCENARIOS.md'
$scenarioText = Get-Content -Raw -Encoding utf8 -LiteralPath $scenarioPath
$scenarioHeadings = @([regex]::Matches($scenarioText, '(?m)^## S-([0-9]+) '))
if ($scenarioHeadings.Count -ne 136) { Add-Failure "Behavioral scenario count is $($scenarioHeadings.Count), expected 136" }
$scenarioNumbers = @($scenarioHeadings | ForEach-Object { [int]$_.Groups[1].Value })
foreach ($number in 1..136) {
    $occurrences = @($scenarioNumbers | Where-Object { $_ -eq $number }).Count
    if ($occurrences -eq 0) { Add-Failure "Behavioral scenario missing: S-$number" }
    elseif ($occurrences -gt 1) { Add-Failure "Behavioral scenario duplicated: S-$number" }
}
foreach ($requiredScenarioPhrase in @(
    'Working Process without a suitable Loop',
    'Admission or decision authority unavailable',
    'Candidate Work Context not approved',
    'historical Quick Start is never selected',
    'Independent axes and all six combinations',
    'Project inheritance and initiative override',
    'Compact mode cannot suppress mandatory messages',
    'Detailed mode groups actions without chain of thought',
    'Invalid preference and higher-priority constraint'
    'Direct reversible work and script/driver non-use'
    'Source-heavy multi-slice MVP and full-scope data guard'
    'Medium iterative product reuses admitted results'
    'Multi-subsystem integration and system properties'
    'Assurance/equipment PAP strengthening'
    'Legacy bounded change'
    'Research spike remains non-production'
    'Source revision reopens affected reliance only'
    'Returned result and Candidate Lesson'
    'minimal map is navigation, not coverage'
    'material concerns/results have explicit dispositions'
    'full-scope data/state/invariant readiness'
    'relied-on data migration and compatibility'
    'subsystem success does not prove system properties'
    'Optional model-guidance offer'
    'Accepted model-guidance offer'
    'Declined or unanswered model-guidance offer'
    'Host limitation or unavailable model'
    'Model choice cannot grant authority'
    'DPF-first composition'
    'ConOps'
    'User Stories'
    'project-relevant result set'
    'contained results'
    'WPC-09'
    'declared MVP scope'
    'exact requested decision'
    'project language'
    'DPF/RA/RP/Application Guide/PAP'
    'DI-01'
    'Chat and optional Markdown'
    'Accepted risk'
    'Consequential action'
    'plain text'
    'accountable risk owner'
    'one-scan target'
    'percentage complete'
    'Mission Complete!'
    'six combinations'
    'project/INTERACTION_PREFERENCES.yaml'
    'Category-first model guidance'
    'first_working_result'
    'promote_to_engineering'
    'Post-Initiative Lessons Review'
    'immediate critical evidence'
    'contradictory YAML'
)) {
    if (-not $scenarioText.Contains($requiredScenarioPhrase)) {
        Add-Failure "Behavioral contract gap: $requiredScenarioPhrase"
    }
}
foreach ($scenarioContract in @(
    @{ Id = 'S-36'; Marker = 'FC-13' },
    @{ Id = 'S-37'; Marker = 'ConOps' },
    @{ Id = 'S-38'; Marker = 'User Stories' },
    @{ Id = 'S-39'; Marker = 'project-relevant result set' },
    @{ Id = 'S-40'; Marker = 'contained results' },
    @{ Id = 'S-41'; Marker = 'WPC-09' },
    @{ Id = 'S-42'; Marker = 'declared MVP scope' },
    @{ Id = 'S-43'; Marker = 'exact requested decision' },
    @{ Id = 'S-44'; Marker = 'project language' },
    @{ Id = 'S-45'; Marker = 'DPF/RA/RP/Application Guide/PAP' },
    @{ Id = 'S-46'; Marker = 'cross-class response state' },
    @{ Id = 'S-47'; Marker = 'one Candidate configuration' },
    @{ Id = 'S-48'; Marker = 'accountable risk owner' },
    @{ Id = 'S-49'; Marker = 'exact action verb' },
    @{ Id = 'S-50'; Marker = 'one-scan target' },
    @{ Id = 'S-51'; Marker = 'observable state' },
    @{ Id = 'S-52'; Marker = 'admitted intended outcome' },
    @{ Id = 'S-53'; Marker = 'six combinations' },
    @{ Id = 'S-54'; Marker = 'silence' },
    @{ Id = 'S-55'; Marker = 'on request or material assignment need' },
    @{ Id = 'S-56'; Marker = 'human_gate_triggers' },
    @{ Id = 'S-57'; Marker = 'promote_to_engineering' },
    @{ Id = 'S-58'; Marker = 'explicit consent' },
    @{ Id = 'S-59'; Marker = 'Run evidence/observation' },
    @{ Id = 'S-60'; Marker = 'ignored for authority' }
)) {
    $pattern = '(?ms)^## ' + [regex]::Escape($scenarioContract.Id) + ' .*?(?=^## S-|^## Acceptance summary)'
    $section = [regex]::Match($scenarioText, $pattern).Value
    if (-not $section.Contains($scenarioContract.Marker)) {
        Add-Failure "Behavioral scenario mapping gap: $($scenarioContract.Id) -> $($scenarioContract.Marker)"
    }
}

# Immediate critical evidence guards are section-scoped regression evidence.
# Semantic replay remains responsible for bounded-route and authority meaning.
$workingProcessChangeSection = [regex]::Match(
    $workingGuideText,
    '(?ms)^## 14\. .*?(?=^## 15\.)'
).Value
if (-not $workingProcessChangeSection.Contains('Run evidence/observation')) {
    Add-Failure 'Working Process immediate evidence observation guard missing'
}
if (-not $workingProcessChangeSection.Contains('`impact`')) {
    Add-Failure 'Working Process immediate evidence impact guard missing'
}
if (-not $workingProcessChangeSection.Contains('`route`')) {
    Add-Failure 'Working Process immediate evidence route guard missing'
}

$s59Section = [regex]::Match(
    $scenarioText,
    '(?ms)^## S-59 .*?(?=^## S-|^## Acceptance summary)'
).Value
if (-not $s59Section.Contains('Run evidence/observation')) {
    Add-Failure 'S-59 immediate evidence observation guard missing'
}
if (-not $s59Section.Contains('impact')) {
    Add-Failure 'S-59 immediate evidence impact guard missing'
}
if (-not $s59Section.Contains('route')) {
    Add-Failure 'S-59 immediate evidence route guard missing'
}
# These exact markers guard repaired projections; semantic replay remains required.
foreach ($repairedScenarioContract in @(
    @{ Id = 'S-36'; Marker = 'FC-13-first operational entry' },
    @{ Id = 'S-39'; Marker = 'admitted reduction trace' },
    @{ Id = 'S-43'; Marker = 'adjacent WPC-06 decision wrapper' }
)) {
    $pattern = '(?ms)^## ' + [regex]::Escape($repairedScenarioContract.Id) + ' .*?(?=^## S-|^## Acceptance summary)'
    $section = [regex]::Match($scenarioText, $pattern).Value
    if (-not $section.Contains($repairedScenarioContract.Marker)) {
        Add-Failure "Repaired behavioral projection missing: $($repairedScenarioContract.Id) -> $($repairedScenarioContract.Marker)"
    }
}

# Decision UI cross-carrier markers are regression evidence; semantic replay remains required.
$decisionUiCarriers = @($agentsText, $bootstrapText, $workingGuideText, $readmeText, $scenarioText) -join "`n"
foreach ($requiredDecisionUiPhrase in @(
    'human-readable situation heading',
    'Required Decision',
    'exact Candidate configuration',
    'risk acceptance',
    'consequential action',
    'plain text',
    'clarification'
)) {
    if (-not $decisionUiCarriers.Contains($requiredDecisionUiPhrase)) {
        Add-Failure "Decision UI projection gap: $requiredDecisionUiPhrase"
    }
}

# Per-locus Decision UI guards close aggregate-marker false negatives; semantic replay remains the oracle.
$workingDecisionUiSection = [regex]::Match(
    $workingGuideText,
    '(?ms)^#### Decision UI .*?(?=^#### `WPC-07`)'
).Value
if (-not $workingDecisionUiSection) {
    Add-Failure 'Working Process WPC-06 Decision UI section boundary missing'
}
foreach ($locusContract in @(
    @{ Name = 'Working Process DI taxonomy'; Text = $workingDecisionUiSection; Markers = @(
        'DI-01 Review', 'DI-02 Choice', 'DI-03 Change', 'DI-04 Conflict',
        'DI-05 Risk', 'DI-06 Missing input', 'DI-07 Failed verification', 'DI-08 Consequential action',
        'candidate_admission', 'process_authority', 'risk_acceptance', 'missing_input',
        'consequential_action', 'clarification', 'cross-class response state'
    ) },
    @{ Name = 'Working Process specialization completion'; Text = $workingDecisionUiSection; Markers = @(
        'request a new option is a return route', 'not rejection of all current options',
        'prior Admission that remains valid', 'prior Admission that is reopened',
        'affected relying use after the change', 'exact conflicting source/decision identities',
        'human-selected resolution basis', 'add data/source', 'limit scope',
        'defer the blocked reliance', 'uploaded file does not become authoritative'
    ) },
    @{ Name = 'Working Process Layer C'; Text = $workingDecisionUiSection; Markers = @(
        'newly allowed effects', 'what remains prohibited', 'decision actor',
        'date/time when available', 'decision record when one created', 'return/reopen route'
    ) },
    @{ Name = 'Working Process risk accountability'; Text = $workingDecisionUiSection; Markers = @(
        'accountable risk owner', 'review condition/date', 'reopen trigger',
        'unaccepted residual part', 'bounded relying use'
    ) },
    @{ Name = 'Working Process scan budget'; Text = $workingDecisionUiSection; Markers = @(
        'Default one-scan target', 'decision-relevant bullets',
        'explicit recommendation', 'descriptive details link', 'justified overflow'
    ) },
    @{ Name = 'Bootstrap Decision UI projection'; Text = $bootstrapText; Markers = @(
        'DI-01', 'DI-08', 'accountable risk owner', 'reopen trigger',
        'newly allowed', 'still-prohibited', 'decision-record link'
    ) },
    @{ Name = 'README Decision UI projection'; Text = $readmeText; Markers = @(
        'DI-01 Review', 'DI-08 Consequential action', 'accountable risk owner',
        'reopen trigger', 'newly allowed', 'still-prohibited', 'decision-record link'
    ) }
)) {
    foreach ($marker in $locusContract.Markers) {
        if (-not $locusContract.Text.Contains($marker)) {
            Add-Failure "Decision UI per-locus gap: $($locusContract.Name) -> $marker"
        }
    }
}

foreach ($scenarioSpecialization in @(
    @{ Id = 'S-46'; Markers = @(
        'DI-01', 'DI-08', 'comparison', 'request a new option is a return route',
        'not rejection of all current options', 'before/after/supersession',
        'prior Admission that remains valid', 'prior Admission that is reopened',
        'affected relying use after the change', 'exact conflicting source/decision identities',
        'competing authority', 'human-selected resolution basis', 'missing input',
        'add data/source', 'limit scope', 'defer the blocked reliance',
        'failed claim', 'cross-class response state'
    ) },
    @{ Id = 'S-47'; Markers = @('newly allowed', 'still-prohibited', 'actor/date when available', 'decision-record link when created') },
    @{ Id = 'S-48'; Markers = @('accountable risk owner', 'reopen trigger', 'bounded relying use') },
    @{ Id = 'S-49'; Markers = @('exact action verb', 'target', 'exact configuration', 'side effects', 'recovery/reversibility', 'verification', 'accountable action authority') },
    @{ Id = 'S-50'; Markers = @('one-scan target', 'decision-relevant bullets', 'one recommendation', 'at most one details link', 'justified overflow') }
)) {
    $pattern = '(?ms)^## ' + [regex]::Escape($scenarioSpecialization.Id) + ' .*?(?=^## S-|^## Acceptance summary)'
    $section = [regex]::Match($scenarioText, $pattern).Value
    foreach ($marker in $scenarioSpecialization.Markers) {
        if (-not $section.Contains($marker)) {
            Add-Failure "Decision UI scenario specialization gap: $($scenarioSpecialization.Id) -> $marker"
        }
    }
}

# Interaction preference contract
$preferenceCarriers = @($agentsText, $bootstrapText, $workingGuideText, $readmeText)
$combinedPreferenceText = $preferenceCarriers -join "`n"
foreach ($requiredPreferencePhrase in @(
    'guided',
    'standard',
    'compact',
    'detailed',
    'milestone',
    'project/INTERACTION_PREFERENCES.yaml',
    'host/system constraints',
    'chain of thought'
)) {
    if (-not $combinedPreferenceText.Contains($requiredPreferencePhrase)) {
        Add-Failure "Interaction preference contract gap: $requiredPreferencePhrase"
    }
}
if ($bootstrapText -notmatch '(?m)^interaction_mode: compact\r?\nexplanation_mode: milestone$') {
    Add-Failure 'Bootstrap preference defaults are missing or reordered'
}
if ($workingGuideText -notmatch 'Working Process, Loop contract, Task scope') {
    Add-Failure 'Working Process preference boundary is missing'
}
foreach ($combination in @(
    '| `guided` | `detailed` |',
    '| `guided` | `milestone` |',
    '| `standard` | `detailed` |',
    '| `standard` | `milestone` |',
    '| `compact` | `detailed` |',
    '| `compact` | `milestone` |'
)) {
    if (-not $readmeText.Contains($combination)) {
        Add-Failure "README interaction combination is missing: $combination"
    }
}

# Model-guidance and Model Assignment contract
$modelGuidancePath = Join-Path $repoRoot 'MODEL_SELECTION_RECOMMENDATIONS.md'
if (-not (Test-Path -LiteralPath $modelGuidancePath -PathType Leaf)) {
    Add-Failure 'Model selection recommendations are missing'
}
else {
    $modelGuidanceText = Get-Content -Raw -Encoding utf8 -LiteralPath $modelGuidancePath
    $modelContractText = @($agentsText, $bootstrapText, $workingGuideText, $readmeText, $modelGuidanceText, $scenarioText) -join "`n"
    foreach ($requiredModelPhrase in @(
        'optional model-guidance offer'
        'Candidate Model Assignment'
        'host/system constraints'
        'review_model_role'
        'escalation_model_role'
        'privacy_boundary'
        'cross-family review'
        'Model choice cannot grant authority'
    )) {
        if (-not $modelContractText.Contains($requiredModelPhrase)) {
            Add-Failure "Model-guidance contract gap: $requiredModelPhrase"
        }
    }
    if ($modelGuidanceText -notmatch 'Status: \x60admitted_informative_guidance\x60') {
        Add-Failure 'Model selection recommendations status is not admitted informative guidance'
    }
    if (-not $bootstrapText.Contains('Behavioral invariant: optional offer; one substantive adaptive question; no Bootstrap blocking.')) {
        Add-Failure 'Bootstrap optional model offer boundary is missing'
    }
    if (-not $workingGuideText.Contains('Authority invariant: model capability does not change Task authority.')) {
        Add-Failure 'Working Process model authority boundary is missing'
    }
}

# Execution UX contracts and reusable templates
$lessonsTemplatePath = Join-Path $repoRoot 'templates/POST_INITIATIVE_LESSONS_REVIEW_TEMPLATE.md'
$stateTemplatePath = Join-Path $repoRoot 'templates/STATE_INDEX_TEMPLATE.yaml'
if (-not (Test-Path -LiteralPath $lessonsTemplatePath -PathType Leaf)) { Add-Failure 'Post-Initiative Lessons template is missing' }
if (-not (Test-Path -LiteralPath $stateTemplatePath -PathType Leaf)) { Add-Failure 'State index template is missing' }
$lessonsTemplateText = if (Test-Path -LiteralPath $lessonsTemplatePath) { Get-Content -Raw -Encoding utf8 -LiteralPath $lessonsTemplatePath } else { '' }
$stateTemplateText = if (Test-Path -LiteralPath $stateTemplatePath) { Get-Content -Raw -Encoding utf8 -LiteralPath $stateTemplatePath } else { '' }
$uxContractText = @($agentsText, $bootstrapText, $workingGuideText, $readmeText, $roadmapText, $scenarioText, $modelGuidanceText) -join "`n"
if (-not $uxContractText.Contains('progress_fields: completed | current | remaining | open_questions | next_gate')) { Add-Failure 'Progress field contract gap' }
foreach ($uxPhrase in @(
    'Mission Complete!'
    'guided + detailed'
    'compact + milestone'
    'profile: forsage'
    'completion_route: discard | promote_to_engineering'
    'Post-Initiative Lessons Review'
    'missing, stale, invalid or contradictory'
    'grants no authority'
    'category, concise rationale, main trade-off and escalation trigger'
)) {
    if (-not $uxContractText.Contains($uxPhrase) -and -not $stateTemplateText.Contains($uxPhrase)) { Add-Failure "Execution UX contract gap: $uxPhrase" }
}
foreach ($lessonSection in @('## Initiative, Baseline and Scope','## Planned versus Actual Outcome','## Path and Human Gates','## Evidence Inventory','## Successes','## Failures and Friction','## Candidate Pattern Cards','## Candidate Antipattern Cards','## Overhead and Effectiveness','## Recommendations and Affected Loci','## Verification','## Decision and Reopen Route')) {
    if (-not $lessonsTemplateText.Contains($lessonSection)) { Add-Failure "Lessons template section gap: $lessonSection" }
}
foreach ($lessonField in @('id','type','context','evidence','mechanism','consequence','guard','detection','observed outcome','countercase','applicability','confidence/evidence bound','owner/authority','recommended use/disposition','verification','reopen trigger','status')) {
    if (-not $lessonsTemplateText.Contains("| $lessonField |")) { Add-Failure "Lessons template field gap: $lessonField" }
}
if (-not $lessonsTemplateText.Contains('| type | `pattern` |')) { Add-Failure 'Lessons pattern card type is missing' }
if (-not $lessonsTemplateText.Contains('| type | `antipattern` |')) { Add-Failure 'Lessons antipattern card type is missing' }
if ([regex]::Matches($lessonsTemplateText, [regex]::Escape('| status | `candidate` |')).Count -lt 2) { Add-Failure 'Lessons cards must start as candidate' }
foreach ($stateKey in @('schema_version:','project_id:','active_initiative:','product_baseline:','current_phase:','current_loop:','current_task:','current_run:','admitted_results:','candidate_results:','allowed_actions:','prohibited_actions:','open_questions:','next_human_gate:','reopen_routes:','carrier_refs:','last_verified:')) {
    if (-not $stateTemplateText.Contains($stateKey)) { Add-Failure "State template key gap: $stateKey" }
}
foreach ($stateBoundary in @('not an authority carrier','grants no authority','admits no result','missing, stale, invalid or contradictory','ignore this projection for authority')) {
    if (-not $stateTemplateText.Contains($stateBoundary)) { Add-Failure "State template boundary gap: $stateBoundary" }
}
if (Test-Path -LiteralPath (Join-Path $repoRoot 'project/STATE_INDEX.yaml')) { Add-Failure 'Unauthorized live project/STATE_INDEX.yaml exists' }

# Manifest hashes. PACKAGE_MANIFEST.md itself is intentionally not self-hashed.
$manifestPath = Join-Path $repoRoot 'PACKAGE_MANIFEST.md'
$manifestInventory = [System.Collections.Generic.HashSet[string]]::new([System.StringComparer]::OrdinalIgnoreCase)
$manifestHashRowCount = 0
if (Test-Path -LiteralPath $manifestPath -PathType Leaf) {
    foreach ($line in (Get-Content -Encoding utf8 -LiteralPath $manifestPath)) {
        if ($line -notmatch '^\|') { continue }
        $raw = ($line.Trim() -replace '^\|', '' -replace '\|$', '')
        $columns = @($raw.Split('|') | ForEach-Object { $_.Trim() })
        if ($columns.Count -lt 2) { continue }
        $hash = $columns[$columns.Count - 1]
        if ($hash -notmatch '^[A-Fa-f0-9]{64}$') { continue }
        $manifestHashRowCount++
        $relativePath = $columns[0].Trim('`')
        [void]$manifestInventory.Add($relativePath.Replace('\', '/'))
        $componentPath = Join-Path $repoRoot $relativePath
        if (-not (Test-Path -LiteralPath $componentPath -PathType Leaf)) {
            Add-Failure "Manifest component missing: $relativePath"
            continue
        }
        $actual = (Get-FileHash -Algorithm SHA256 -LiteralPath $componentPath).Hash
        if ($actual -ne $hash.ToUpperInvariant()) {
            Add-Failure "Manifest hash mismatch: $relativePath"
        }
    }
    if ($manifestHashRowCount -ne 41) { Add-Failure "Manifest hash row count is $manifestHashRowCount, expected 41" }

    $actualInventory = [System.Collections.Generic.HashSet[string]]::new([System.StringComparer]::OrdinalIgnoreCase)
    foreach ($file in (Get-ChildItem -LiteralPath $repoRoot -Recurse -Force -File)) {
        $relativePath = (Get-RelativePath $file.FullName).Replace('\', '/')
        if ($relativePath -eq 'PACKAGE_MANIFEST.md') { continue }
        if ($relativePath -match '(^|/)\.git(/|$)') { continue }
        if ($relativePath.StartsWith('project/') -and -not $manifestInventory.Contains($relativePath)) { continue }
        [void]$actualInventory.Add($relativePath)
    }
    foreach ($relativePath in $actualInventory) {
        if (-not $manifestInventory.Contains($relativePath)) {
            Add-Failure "Distributed file is not listed in manifest: $relativePath"
        }
    }
    foreach ($relativePath in $manifestInventory) {
        if (-not $actualInventory.Contains($relativePath)) {
            Add-Failure "Manifest lists a non-distributed file: $relativePath"
        }
    }

    # UTF-8/LF policy applies to manifest text except declared byte-preserved carriers.
    $lfPolicyPaths = [System.Collections.Generic.List[string]]::new()
    foreach ($relativePath in $manifestInventory) { $lfPolicyPaths.Add($relativePath) }
    $lfPolicyPaths.Add('PACKAGE_MANIFEST.md')
    foreach ($relativePath in $lfPolicyPaths) {
        $extension = [System.IO.Path]::GetExtension($relativePath).ToLowerInvariant()
        if ($extension -notin @('.md', '.ps1', '.yaml', '.yml') -and $relativePath -notin @('.gitattributes', 'LICENSE')) { continue }
        if ($protectedTextExceptions -contains $relativePath) { continue }
        $fullPath = Join-Path $repoRoot $relativePath
        if (-not (Test-Path -LiteralPath $fullPath -PathType Leaf)) { continue }
        $bytes = [System.IO.File]::ReadAllBytes($fullPath)
        if ($bytes -contains 13) {
            Add-Failure "Non-LF line ending in policy-applicable text: $relativePath"
        }
    }
}

if ($failures.Count -gt 0) {
    Write-Output "INTEGRITY_CHECK_FAIL ($($failures.Count))"
    foreach ($failure in $failures) { Write-Output "- $failure" }
    exit 1
}

Write-Output "INTEGRITY_CHECK_PASS"
Write-Output "Markdown files: $($markdownFiles.Count)"
Write-Output "DPF patterns: $($patternHeadings.Count)"
Write-Output "AGENTS lines: $($agentLines.Count)"
