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
    'docs/releases/RELEASE_NOTES_3_3_0.md',
    'docs/releases/RELEASE_NOTES_3_4_0.md',
    'docs/releases/RELEASE_NOTES_3_5_0.md',
    'docs/releases/RELEASE_NOTES_3_6_0.md',
    'docs/releases/RELEASE_NOTES_3_6_1.md',
    'examples/CODEX_REFERENCE_CAPABILITY_PROFILE.yaml',
    'tests/behavioral/BOOTSTRAP_SCENARIOS.md',
    'tests/behavioral/RUNTIME_3_6_OPERATIONAL_SCENARIOS.md',
    'tests/conformance/RUNTIME_BOUNDARY_CONFORMANCE_PROTOCOL.md',
    'templates/RUNTIME_CAPABILITY_PROFILE_TEMPLATE.yaml',
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
$releaseNotesText = Get-Content -Raw -Encoding utf8 -LiteralPath (Join-Path $repoRoot 'docs/releases/RELEASE_NOTES_3_4_0.md')
$releaseNotes350Text = Get-Content -Raw -Encoding utf8 -LiteralPath (Join-Path $repoRoot 'docs/releases/RELEASE_NOTES_3_5_0.md')
$releaseNotes360Path = Join-Path $repoRoot 'docs/releases/RELEASE_NOTES_3_6_0.md'
$releaseNotes360Text = Get-Content -Raw -Encoding utf8 -LiteralPath $releaseNotes360Path
$releaseNotes361Path = Join-Path $repoRoot 'docs/releases/RELEASE_NOTES_3_6_1.md'
$releaseNotes361Text = Get-Content -Raw -Encoding utf8 -LiteralPath $releaseNotes361Path

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
$middleDot = [char]0x00B7
$decodeUtf8Marker = { param([string]$value) [Text.Encoding]::UTF8.GetString([Convert]::FromBase64String($value)) }
$candidateIdentity = "Instantiatio DPF 3.4.0 $emDash Engineering Work Runtime $middleDot Beta"
$releaseIdentity = "Instantiatio DPF 3.6.1 $emDash Engineering Work Runtime $middleDot Beta"
$readmeIdentity = "Instantiatio DPF (iDPF) 3.6.1 $emDash Engineering Work Runtime $middleDot Beta"
if (-not $readmeText.StartsWith("# $readmeIdentity`n")) {
    Add-Failure 'README release-level identity is missing'
}
if (-not $manifestText.StartsWith("# $releaseIdentity $emDash Package Manifest`n")) {
    Add-Failure 'Manifest release-level identity is missing'
}
foreach ($releaseConfigurationMarker in @(
    '| Runtime version | `3.6.1` |',
    '| Assembly date | `2026-08-26` |',
    '| Archive identity | `Instantiatio-DPF-3.6.1-Beta.zip` |',
    '| Archive top-level directory | `Instantiatio-DPF-3.6.1-Beta` |'
)) {
    if (-not $manifestText.Contains($releaseConfigurationMarker)) {
        Add-Failure "Manifest 3.6.1 configuration marker missing: $releaseConfigurationMarker"
    }
}
foreach ($publicIdentityContract in @(
    @{ Name = 'README copyright'; Text = $readmeText; Marker = 'Copyright (c) 2026 Instantiatio DPF contributors' },
    @{ Name = 'README MIT link'; Text = $readmeText; Marker = '[MIT License](LICENSE)' },
    @{ Name = 'README canonical repository'; Text = $readmeText; Marker = 'https://github.com/aalberter/Instantiatio-DPF' },
    @{ Name = 'README FPF source'; Text = $readmeText; Marker = 'https://github.com/ailev/FPF' },
    @{ Name = 'README portable Runtime identity'; Text = $readmeText; Marker = (& $decodeUtf8Marker 'KippRFBGIOKAlCDQv9C10YDQtdC90L7RgdC40LzQsNGPINGB0YDQtdC00LAg0L7RgNCz0LDQvdC40LfQsNGG0LjQuCDQuNC90LbQtdC90LXRgNC90L7QuSDRgNCw0LHQvtGC0Ysg0YfQtdC70L7QstC10LrQsCDQuCBBSS3QsNCz0LXQvdGC0L7Qsi4qKg==') },
    @{ Name = 'README non-official boundary'; Text = $readmeText; Marker = (& $decodeUtf8Marker '0L3QtSDRj9Cy0LvRj9C10YLRgdGPINC+0YTQuNGG0LjQsNC70YzQvdC+0Lkg0LTQuNGB0YLRgNC40LHRg9GG0LjQtdC5IEZQRg==') },
    @{ Name = 'README non-affiliation boundary'; Text = $readmeText; Marker = (& $decodeUtf8Marker 'YWZmaWxpYXRpb24g0LjQu9C4IGVuZG9yc2VtZW50INCw0LLRgtC+0YDQsNC80LggRlBGINC90LUg0LfQsNGP0LLQu9GP0Y7RgtGB0Y8=') },
    @{ Name = 'README no-redistribution boundary'; Text = $readmeText; Marker = (& $decodeUtf8Marker '0JLQvdC10YjQvdC40LUgRlBGLdGE0LDQudC70Ysg0L3QtSDQstC60LvRjtGH0LDRjtGC0YHRjyDQsiDQv9Cw0LrQtdGCINC4INC90LUgcmVsaWNlbnNlZA==') },
    @{ Name = 'README protected identity'; Text = $readmeText; Marker = (& $decodeUtf8Marker 'YEFJX1NETENfRFBGLyoqYCDRj9Cy0LvRj9C10YLRgdGPIHByb3RlY3RlZCByZWFkLW9ubHkgbG9jdXM=') }
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
    @{ Component = 'Engineering Work Runtime'; Carrier = $readmeText; Label = (& $decodeUtf8Marker '0JLQtdGA0YHQuNGPIGlEUEYgUnVudGltZQ==') },
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

# Package status, maturity and accepted limitation visibility
$publicationStatus = $null
if ($manifestText -notmatch '\| Publication status \| \x60(candidate|released)\x60 \|') {
    Add-Failure 'Manifest publication status must be candidate or released'
}
else {
    $publicationStatus = $matches[1]
}
if ($manifestText -notmatch '\| Product maturity \| \x60Beta\x60 \|') {
    Add-Failure 'Manifest product maturity must be Beta'
}
foreach ($packageStatusContract in @(
    @{ Name = 'README'; Text = $readmeText; Marker = (& $decodeUtf8Marker 'PiDQktC10YDRgdC40Y8gaURQRiBSdW50aW1lOiBgMy42LjFgOyDQstGB0YLRgNC+0LXQvdC90YvQuSDRgdGC0LDRgtGD0YEg0LLRi9C/0YPRgdC60LA6IGByZWxlYXNlZGA7INC30YDQtdC70L7RgdGC0Ywg0L/RgNC+0LTRg9C60YLQsDogYEJldGFgOyDQstGL0L/Rg9GJ0LXQvdC90YvQuSDQv9GA0LXQtNGI0LXRgdGC0LLQtdC90L3QuNC6OiBgMy42LjBgOyDQstC60LvRjtGH0ZHQvdC90YvQuSBBSSBTRExDIERQRjog0L3QtdC40LfQvNC10L3RkdC90L3Ri9C5IGAxLjAuMWAu') },
    @{ Name = 'Manifest component'; Text = $manifestText; Marker = ('| Engineering Work Runtime | `3.6.1` | ' + $publicationStatus + ' ' + $middleDot + ' Beta |') },
    @{ Name = 'Roadmap'; Text = $roadmapText; Marker = ('| Engineering Work Runtime | `3.6.1` | ' + $publicationStatus + ' ' + $middleDot + ' Beta |') }
)) {
    if (-not $packageStatusContract.Text.Contains($packageStatusContract.Marker)) {
        Add-Failure "Package status contract mismatch: $($packageStatusContract.Name)"
    }
}
foreach ($requiredReleasePhrase in @(
    '## Known accepted release limitation',
    'ISO/IEC/IEEE DIS 29148 Ed.3',
    'stage `40.00`',
    'accepted_non_blocking',
    'reopened_assessed_nonblocking_for_3_6_1',
    'no external currentness refresh',
    'no successor-status/compliance claim',
    'DPF unchanged'
)) {
    if (-not $manifestText.Contains($requiredReleasePhrase)) {
        Add-Failure "Released package limitation guard missing: $requiredReleasePhrase"
    }
}
if ((Get-FileHash -Algorithm SHA256 -LiteralPath $releaseNotes360Path).Hash -ne 'D123D46B8CD7AD3F6F5E802F8CEED18128E4D93CA7A254BF67F4D520601BDDF8') {
    Add-Failure 'Admitted Release Notes 3.6.0 hash mismatch'
}
if (-not $releaseNotes360Text.Contains('> Release status: `released`')) {
    Add-Failure 'Release Notes 3.6.0 public release-status marker missing'
}
foreach ($staleReleaseNotes360Marker in @(
    'candidate_pending_admission',
    'Final assembly date: pending',
    'Current engineering state | Candidate',
    'Planned ZIP',
    'L05',
    'L06',
    'package closure remains deferred',
    'final ZIP do not exist'
)) {
    if ($releaseNotes360Text.Contains($staleReleaseNotes360Marker)) {
        Add-Failure "Release Notes 3.6.0 stale assembly marker: $staleReleaseNotes360Marker"
    }
}
if ((Get-FileHash -Algorithm SHA256 -LiteralPath $releaseNotes361Path).Hash -ne '305C89EEF6BB9EA0D2D7F856504BB7FB34DC4C1F95CAD0805D6D50CFB1D2ED9D') {
    Add-Failure 'Admitted Release Notes 3.6.1 hash mismatch'
}
foreach ($requiredReleaseNotes361Marker in @(
    ("# $releaseIdentity"),
    '> Release status: `released`',
    '> Release date: `2026-08-26`',
    '> Released predecessor: `3.6.0`',
    '> Included AI SDLC DPF: unchanged `1.0.1`',
    'Instantiatio-DPF-3.6.1-Beta.zip',
    'text-complete Gate Projection',
    'REL361 = reopened_assessed_nonblocking_for_3_6_1; no external currentness refresh; no successor-status/compliance claim; DPF unchanged'
)) {
    if (-not $releaseNotes361Text.Contains($requiredReleaseNotes361Marker)) {
        Add-Failure "Release Notes 3.6.1 contract marker missing: $requiredReleaseNotes361Marker"
    }
}
foreach ($staleReleaseNotes361Marker in @(
    'candidate_pending_admission',
    'Final assembly date: pending',
    'Planned ZIP',
    'package closure remains deferred',
    'final ZIP do not exist'
)) {
    if ($releaseNotes361Text.Contains($staleReleaseNotes361Marker)) {
        Add-Failure "Release Notes 3.6.1 stale assembly marker: $staleReleaseNotes361Marker"
    }
}

# Runtime 3.4.0 Beta release-note contract.
$decodeReleaseNoteMarker = { param([string]$value) [Text.Encoding]::UTF8.GetString([Convert]::FromBase64String($value)) }
$releaseNoteStages = & $decodeReleaseNoteMarker 'YNCt0YLQsNC/0Ysg0YDQsNCx0L7RgtGLYA=='
$releaseNoteOptions = & $decodeReleaseNoteMarker 'YNCS0LDRgNC40LDQvdGC0Ysg0YDQtdGI0LXQvdC40Y9g'
$releaseNoteRecommended = & $decodeReleaseNoteMarker 'YNCf0YDQuNC90Y/RgtGMINGA0LXQutC+0LzQtdC90LTQvtCy0LDQvdC90YvQuSDQstCw0YDQuNCw0L3RgmA='
$legacyRequiredDecision = & $decodeReleaseNoteMarker '0KLRgNC10LHRg9C10LzQvtC1INGA0LXRiNC10L3QuNC1'
$releaseNoteOrderedHeadings = @(
    (& $decodeReleaseNoteMarker 'IyMg0JrRgNCw0YLQutC+INC+INCy0YvQv9GD0YHQutC1'),
    (& $decodeReleaseNoteMarker 'IyMg0JPQu9Cw0LLQvdGL0LUg0LjQt9C80LXQvdC10L3QuNGP'),
    '### Optional HSI/UI capability',
    (& $decodeReleaseNoteMarker 'IyMjINCv0YHQvdC+0YHRgtGMINCy0LfQsNC40LzQvtC00LXQudGB0YLQstC40Y8='),
    (& $decodeReleaseNoteMarker 'IyMg0JrQvtC80YMg0Y3RgtC+INC90YPQttC90L4='),
    (& $decodeReleaseNoteMarker 'IyMg0KHQvtCy0LzQtdGB0YLQuNC80L7RgdGC0Yw='),
    (& $decodeReleaseNoteMarker 'IyMg0KHQutCw0YfQsNGC0Ywg0Lgg0L/RgNC+0LLQtdGA0LjRgtGM'),
    (& $decodeReleaseNoteMarker 'IyMg0J/RgNC+0LLQtdGA0LrQsCDQuCDQvtCz0YDQsNC90LjRh9C10L3QuNGP'),
    (& $decodeReleaseNoteMarker 'IyMgUmVjb3Zlcnkg0Lgg0LPRgNCw0L3QuNGG0Ysg0L/QvtC70L3QvtC80L7Rh9C40Lk=')
)
$previousReleaseNoteHeadingIndex = -1
foreach ($releaseNoteHeading in $releaseNoteOrderedHeadings) {
    $headingPattern = '(?m)^' + [regex]::Escape($releaseNoteHeading) + '$'
    $headingMatches = [regex]::Matches($releaseNotesText, $headingPattern)
    if ($headingMatches.Count -ne 1) {
        Add-Failure "Release notes heading count mismatch: $releaseNoteHeading ($($headingMatches.Count))"
        continue
    }
    if ($headingMatches[0].Index -le $previousReleaseNoteHeadingIndex) {
        Add-Failure "Release notes heading order mismatch: $releaseNoteHeading"
    }
    $previousReleaseNoteHeadingIndex = $headingMatches[0].Index
}

$releaseNoteRequiredMarkers = @(
    "# $candidateIdentity",
    '- Publication status: `released`',
    'Release Admission:',
    (& $decodeReleaseNoteMarker '0L3QtSDRgdC+0LfQtNCw0Y7RgiBSZWxlYXNlIEFkbWlzc2lvbg=='),
    'optional experimental',
    (& $decodeReleaseNoteMarker 'SHVtYW7igJNTeXN0ZW0gSW50ZXJhY3Rpb24='),
    'derived engineering view',
    'Interaction Model',
    'Screen Specification',
    (& $decodeReleaseNoteMarker 'SHVtYW4gVmFsaWRhdGlvbiDQvdC1INC30LDQvNC10L3Rj9C10YIgVmVyaWZpY2F0aW9u'),
    (& $decodeReleaseNoteMarker '0L/RgNC+0YLQvtGC0LjQvyDQvdC1INGB0YLQsNC90L7QstC40YLRgdGPIHByb2R1Y3Rpb24gaW1wbGVtZW50YXRpb24='),
    (& $decodeReleaseNoteMarker '0L3QtSDQvNC40LPRgNC40YDRg9GO0YIg0LDQstGC0L7QvNCw0YLQuNGH0LXRgdC60Lg='),
    (& $decodeReleaseNoteMarker 'YNCt0YLQsNC/0Ysg0YDQsNCx0L7RgtGLYA=='),
    (& $decodeReleaseNoteMarker 'YNCg0LXQutC+0LzQtdC90LTQsNGG0LjRj2A='),
    (& $decodeReleaseNoteMarker 'YNCS0LDRgNC40LDQvdGC0Ysg0YDQtdGI0LXQvdC40Y9g'),
    (& $decodeReleaseNoteMarker 'YNCf0YDQuNC90Y/RgtGMINGA0LXQutC+0LzQtdC90LTQvtCy0LDQvdC90YvQuSDQstCw0YDQuNCw0L3RgmA='),
    'ambiguous assent',
    (& $decodeReleaseNoteMarker 'YFMtMWDigJNgUy0xODBg'),
    'Instantiatio-DPF-3.4.0-Beta.zip',
    (& $decodeReleaseNoteMarker 'dG9wLWxldmVsINC60LDRgtCw0LvQvtCzIGBJbnN0YW50aWF0aW8tRFBGLTMuNC4wLUJldGFg'),
    (& $decodeReleaseNoteMarker 'YDQ2YCDRhNCw0LnQu9C+0LI='),
    '`RELEASE_CANDIDATE.json`',
    'GitHub source archives',
    'synthetic pilot',
    'no field-benefit claim',
    'common promotion',
    'CAV'
)
foreach ($releaseNoteMarker in $releaseNoteRequiredMarkers) {
    if (-not $releaseNotesText.Contains($releaseNoteMarker)) {
        Add-Failure "Release notes contract gap: $releaseNoteMarker"
    }
}

if ([regex]::Matches($releaseNotesText, '(?m)^- Publication status:').Count -ne 1) {
    Add-Failure 'Release notes publication-status statement must occur exactly once'
}

$releaseNoteForbiddenMarkers = @(
    (& $decodeReleaseNoteMarker '0KHRgtCw0YLRg9GBINC/0YPQsdC70LjQutCw0YbQuNC4Og=='),
    '`separate_decision_required`',
    (& $decodeReleaseNoteMarker 'IyMg0KfRgtC+INC40LfQvNC10L3QuNC70L7RgdGM'),
    (& $decodeReleaseNoteMarker 'IyMg0J/QvtGH0LXQvNGDINGN0YLQviDQu9GD0YfRiNC1'),
    (& $decodeReleaseNoteMarker 'IyMg0KHQvtCy0LzQtdGB0YLQuNC80L7RgdGC0Ywg0LggbWlncmF0aW9u'),
    (& $decodeReleaseNoteMarker 'IyMg0KHQstC40LTQtdGC0LXQu9GM0YHRgtCy0LAg0Lgg0L7Qs9GA0LDQvdC40YfQtdC90LjRjw=='),
    (& $decodeReleaseNoteMarker 'IyMg0KHQutCw0YfQsNGC0Ywg0Lgg0L3QsNGH0LDRgtGMINGA0LDQsdC+0YLRgw=='),
    (& $decodeReleaseNoteMarker 'IyMg0JfQsNC80LXQvdCwIGhhbmRvZmYg0LIg0YLQvtC5INC20LUg0LLQtdGA0YHQuNC4'),
    (& $decodeReleaseNoteMarker 'IyMg0JLQvtGB0YHRgtCw0L3QvtCy0LvQtdC90LjQtSDQuCDQv9C+0LLRgtC+0YDQvdC+0LUg0L7RgtC60YDRi9GC0LjQtQ=='),
    (& $decodeReleaseNoteMarker 'IyMg0JPRgNCw0L3QuNGG0LAg0L/QvtC70L3QvtC80L7Rh9C40Lk='),
    (& $decodeReleaseNoteMarker '0LHRg9C00YPRgiDQt9Cw0YTQuNC60YHQuNGA0L7QstCw0L3RiyDQvtGC0LTQtdC70YzQvdC+'),
    (& $decodeReleaseNoteMarker '0J/QvtGB0LvQtSDQvtGC0LTQtdC70YzQvdC+0LkgUmVsZWFzZSBBZG1pc3Npb24='),
    (& $decodeReleaseNoteMarker '0LTQviDQvtGC0LTQtdC70YzQvdC+0LPQviBleGFjdCB0cmFuc2l0aW9uL2J1aWxkIGF1dGhvcml0eSDQuCDQvdC+0LLQvtC5IFJlbGVhc2UgQWRtaXNzaW9u')
)
foreach ($releaseNoteForbiddenMarker in $releaseNoteForbiddenMarkers) {
    if ($releaseNotesText.Contains($releaseNoteForbiddenMarker)) {
        Add-Failure "Release notes stale or forbidden marker: $releaseNoteForbiddenMarker"
    }
}

# Runtime 3.5.0 Beta semantic release-note contract.
$release350Required = @(
    @{ Label = 'identity'; Token64 = 'SURQRiAzLjUuMA=='; Exact = $true },
    @{ Label = 'content_release'; Token64 = 'Q29udGVudCBBcHByb3ZhbCDiiaAgUmVsZWFzZSBBZG1pc3Npb24='; Exact = $true },
    @{ Label = 'verification_admission'; Token64 = 'VmVyaWZpY2F0aW9uIOKJoCBBZG1pc3Npb24='; Exact = $false },
    @{ Label = 'validation_verification'; Token64 = 'SHVtYW4gVmFsaWRhdGlvbiDiiaAgVmVyaWZpY2F0aW9u'; Exact = $true },
    @{ Label = 'view_source'; Token64 = 'RGVjaXNpb24gVmlldyDiiaAgQXV0aG9yaXRhdGl2ZSBTb3VyY2U='; Exact = $true },
    @{ Label = 'capability_authority'; Token64 = 'Q2FwYWJpbGl0eSDiiaAgQXV0aG9yaXR5'; Exact = $true },
    @{ Label = 'material_obligation'; Token64 = 'bWF0ZXJpYWxfaHVtYW5fZGVjaXNpb25fb2JsaWdhdGlvbg=='; Exact = $true },
    @{ Label = 'simple_route'; Token64 = 'bm9fbWF0ZXJpYWxfZGVjaXNpb25fbm9fY2VyZW1vbnk='; Exact = $true },
    @{ Label = 'asset_name'; Token64 = 'SW5zdGFudGlhdGlvLURQRi0zLjUuMC1CZXRhLnppcA=='; Exact = $true },
    @{ Label = 'adjacent_identity'; Token64 = 'UkVMRUFTRV9DQU5ESURBVEUuanNvbg=='; Exact = $false }
)
foreach ($contract in $release350Required) {
    $token = [Text.Encoding]::UTF8.GetString([Convert]::FromBase64String($contract.Token64))
    $count = [regex]::Matches($releaseNotes350Text, [regex]::Escape($token)).Count
    if ($count -lt 1) { Add-Failure "Release notes 3.5 marker missing: $($contract.Label)" }
    elseif ($contract.Exact -and $count -ne 1) { Add-Failure "Release notes 3.5 marker cardinality: $($contract.Label) ($count)" }
}
$release350Forbidden = @(
    @{ Label = 'mandatory_simple_approval'; Token64 = 'U2ltcGxlIHdvcmsgcmVxdWlyZXMgbWFuZGF0b3J5IENvbnRlbnQgQXBwcm92YWwu' },
    @{ Label = 'parallel_authority_taxonomy'; Token64 = 'QXJ0aWZhY3QgQXBwcm92YWwgUGxhbm5pbmcgY3JlYXRlcyBhIG5ldyBhdXRob3JpdHkgbGF5ZXIgYW5kIHVuaXZlcnNhbCBkZWNpc2lvbiB0YXhvbm9teS4=' },
    @{ Label = 'decision_view_truth'; Token64 = 'RGVjaXNpb24gVmlldyBpcyB0aGUgYXV0aG9yaXRhdGl2ZSBzb3VyY2Uu' },
    @{ Label = 'content_equals_release'; Token64 = 'Q29udGVudCBBcHByb3ZhbCBpcyBSZWxlYXNlIEFkbWlzc2lvbi4=' },
    @{ Label = 'validation_equals_verification'; Token64 = 'SHVtYW4gVmFsaWRhdGlvbiBpcyBWZXJpZmljYXRpb24u' },
    @{ Label = 'automatic_migration_publication'; Token64 = 'QWxsIGV4aXN0aW5nIHByb2Nlc3NlcyBhcmUgYXV0b21hdGljYWxseSBtaWdyYXRlZCB0byBjb21tb24gQ0FWLCBhbmQgdGhpcyBwcm9qZWN0IHB1Ymxpc2hlcyB0aGUgZmluYWwgWklQIGhhc2ggdG8gR2l0SHViIGJlZm9yZSBmcmVlemUu' }
)
foreach ($contract in $release350Forbidden) {
    $token = [Text.Encoding]::UTF8.GetString([Convert]::FromBase64String($contract.Token64))
    if ($releaseNotes350Text.Contains($token)) { Add-Failure "Release notes 3.5 forbidden claim: $($contract.Label)" }
}
if ([regex]::Matches($releaseNotes350Text, '(?m)^# ').Count -ne 1) { Add-Failure 'Release notes 3.5 must contain one H1' }
$release350H2Count = [regex]::Matches($releaseNotes350Text, '(?m)^## ').Count
if ($release350H2Count -lt 6 -or $release350H2Count -gt 12) { Add-Failure "Release notes 3.5 H2 count is $release350H2Count, expected 6..12" }
if ($releaseNotes350Text.IndexOf('## TL;DR') -lt 0 -or $releaseNotes350Text.IndexOf('## TL;DR') -gt 200) { Add-Failure 'Release notes 3.5 TLDR is not in opening section' }

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
    'interaction_clarity_russian_first'
    'work_stages_generated'
    'applicable_decision_options'
    'recommended_option_exact_effect'
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
    @{ Name = 'Bootstrap Guide'; Text = $bootstrapText; Markers = @('WPC-01', 'WPC-06', 'WPC-07', 'FC-13', 'applicable_decision_options') },
    @{ Name = 'AGENTS dispatcher'; Text = $agentsText; Markers = @('WPC-01', 'WPC-03', 'WPC-06', 'WPC-07', 'WPC-08', 'WPC-09', 'FC-13', 'applicable_decision_options', 'project-relevant Candidate coverage map') },
    @{ Name = 'README navigation'; Text = $readmeText; Markers = @((& $decodeUtf8Marker '0J/RgNC+0YbQtdGB0YEg0L/RgNC+0LXQutGC0LjRgNGD0LXRgtGB0Y8g0L/QvtC0INC30LDQtNCw0YfRgw=='), 'WORKING_PROCESS_AND_LOOPS_GUIDE.md') },
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
if ($scenarioHeadings.Count -ne 188) { Add-Failure "Behavioral scenario count is $($scenarioHeadings.Count), expected 188" }
$scenarioNumbers = @($scenarioHeadings | ForEach-Object { [int]$_.Groups[1].Value })
foreach ($number in 1..188) {
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
    'exact actions/consequences'
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
    'declared | enforced | compensated | unsupported'
    'actual containment evidence'
    'represented_in_result | already_represented_in_baseline | external_system_of_record | disposable_no_reliance | unresolved_deferred'
    'carrier_reference_continuity'
    'russian_first_project_carrier'
    'material HSI concern'
    'namespaced User Interaction View'
    'contained Interaction Model'
    'conditional Screen Specification'
    'Candidate UI Prototype'
    'Human Validation is evidence, not Admission'
    'smallest responsible HSI locus'
    'existing UI baseline is evidence, not requirements'
    'no hidden UI source of truth'
    'exact_term_russian_first_use'
    'decorative_english_translated_by_meaning'
    'work_stages_on_material_transition'
    'recommended_option_restates_exact_effect'
    'failed_verification_no_generic_approval'
    'all one hundred eighty-eight scenarios pass'
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
    @{ Id = 'S-43'; Marker = 'exact actions/consequences' },
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
    @{ Id = 'S-60'; Marker = 'ignored for authority' },
    @{ Id = 'S-137'; Marker = 'actual host/tool/configuration capability' },
    @{ Id = 'S-138'; Marker = 'unsupported' },
    @{ Id = 'S-139'; Marker = 'actual containment evidence' },
    @{ Id = 'S-140'; Marker = 'stale/invalid' },
    @{ Id = 'S-141'; Marker = 'completed actual effects' },
    @{ Id = 'S-142'; Marker = 'side_effect_escape_blocks_success' },
    @{ Id = 'S-143'; Marker = 'no_mandatory_profile' },
    @{ Id = 'S-144'; Marker = 'unresolved_deferred' },
    @{ Id = 'S-145'; Marker = 'no_material_unreconciled_effects' },
    @{ Id = 'S-146'; Marker = 'no_mandatory_git_duplication' },
    @{ Id = 'S-147'; Marker = 'persistence_is_not_admission' },
    @{ Id = 'S-148'; Marker = 'existing baseline identity' },
    @{ Id = 'S-149'; Marker = 'carrier_reference_continuity' },
    @{ Id = 'S-150'; Marker = 'decorative English' },
    @{ Id = 'S-151'; Marker = 'hsi_non_material_no_ceremony' },
    @{ Id = 'S-152'; Marker = 'material_hsi_disposition_before_production' },
    @{ Id = 'S-153'; Marker = 'namespaced_user_interaction_view_is_derived' },
    @{ Id = 'S-154'; Marker = 'interaction_model_combined_by_default' },
    @{ Id = 'S-155'; Marker = 'screen_specification_conditional_combined' },
    @{ Id = 'S-156'; Marker = 'untraceable_ui_behavior_fails_verification' },
    @{ Id = 'S-157'; Marker = 'prototype_is_not_production' },
    @{ Id = 'S-158'; Marker = 'human_validation_is_not_admission' },
    @{ Id = 'S-159'; Marker = 'hsi_finding_smallest_responsible_locus' },
    @{ Id = 'S-160'; Marker = 'presentation_only_stays_local' },
    @{ Id = 'S-161'; Marker = 'affected_hsi_reliance_reopens_only' },
    @{ Id = 'S-162'; Marker = 'production_ui_two_basis_trace' },
    @{ Id = 'S-163'; Marker = 'existing_ui_is_not_requirement' },
    @{ Id = 'S-164'; Marker = 'ui_reference_is_not_requirements_authority' },
    @{ Id = 'S-165'; Marker = 'no_hidden_ui_source_of_truth' },
    @{ Id = 'S-166'; Marker = 'exact_term_russian_first_use' },
    @{ Id = 'S-167'; Marker = 'decorative_english_translated_by_meaning' },
    @{ Id = 'S-168'; Marker = 'machine_text_byte_exact' },
    @{ Id = 'S-169'; Marker = 'exact_type_russian_title_id' },
    @{ Id = 'S-170'; Marker = 'no_english_word_count_oracle' },
    @{ Id = 'S-171'; Marker = 'work_stages_on_material_transition' },
    @{ Id = 'S-172'; Marker = 'work_stages_on_direct_request' },
    @{ Id = 'S-173'; Marker = 'unchanged_or_trivial_stages_omitted' },
    @{ Id = 'S-174'; Marker = 'stage_markers_plain_text_complete' },
    @{ Id = 'S-175'; Marker = 'stage_view_preserves_open_question_next_gate' },
    @{ Id = 'S-176'; Marker = 'recommendation_then_applicable_options' },
    @{ Id = 'S-177'; Marker = 'recommended_option_restates_exact_effect' },
    @{ Id = 'S-178'; Marker = 'conditions_narrowing_new_option_visible' },
    @{ Id = 'S-179'; Marker = 'failed_verification_no_generic_approval' },
    @{ Id = 'S-180'; Marker = 'ambiguous_assent_clarified_effects_confirmed' },
    @{ Id = 'S-181'; Marker = 'material_human_decision_obligation_planned' },
    @{ Id = 'S-182'; Marker = 'existing_admission_mapping_avoids_duplicate_gate' },
    @{ Id = 'S-183'; Marker = 'loop_inherits_material_decision_obligation' },
    @{ Id = 'S-184'; Marker = 'combined_decisions_keep_distinct_effects' },
    @{ Id = 'S-185'; Marker = 'decision_meaning_is_not_status_taxonomy' },
    @{ Id = 'S-186'; Marker = 'decision_presentation_is_local_derived_view' },
    @{ Id = 'S-187'; Marker = 'no_material_decision_no_approval_ceremony' },
    @{ Id = 'S-188'; Marker = 'planned_human_validation_remains_evidence' }
)) {
    $pattern = '(?ms)^## ' + [regex]::Escape($scenarioContract.Id) + ' .*?(?=^## S-|^## Acceptance summary)'
    $section = [regex]::Match($scenarioText, $pattern).Value
    if (-not $section.Contains($scenarioContract.Marker)) {
        Add-Failure "Behavioral scenario mapping gap: $($scenarioContract.Id) -> $($scenarioContract.Marker)"
    }
}

# Material human decision planning markers are bounded structural regression evidence only.
# They do not prove correct project selection, Human decision, Admission or field benefit.
foreach ($materialDecisionMarker in @(
    'material_human_decision_obligation',
    'loop_inherits_material_decision_obligation',
    'no_material_decision_no_ceremony'
)) {
    if (-not $workingGuideText.Contains($materialDecisionMarker)) {
        Add-Failure "Material human decision Guide contract gap: $materialDecisionMarker"
    }
}

# HSI/UI markers are bounded structural regression evidence only.
# They do not prove UI correctness, usability, field benefit, Admission or release readiness.
$hsiGuideSection = [regex]::Match(
    $workingGuideText,
    '(?ms)^#### 3\.1\.9\. .*?HSI/UI.*?(?=^### 3\.2\.)'
).Value
foreach ($hsiGuideMarker in @(
    'optional_hsi_ui_specialization',
    'no_material_hsi_no_ceremony',
    '<project-or-domain>:UIV-<n>',
    'interaction_model_combined_by_default',
    'screen_specification_conditional_combined',
    'Requirements / Scenarios / Roles / Rules / Constraints',
    'Candidate UI Prototype',
    'human_validation_is_not_admission',
    'requirement defect/change',
    'presentation-only issue',
    'production_ui_separate_task_run',
    'no_common_hsi_catalog_promotion',
    'common_hsi_requires_product_admission',
    '`EV-*`'
    '`WM-*`'
)) {
    if (-not $hsiGuideSection.Contains($hsiGuideMarker)) {
        Add-Failure "HSI/UI Guide contract gap: $hsiGuideMarker"
    }
}
foreach ($decorativeHsiPhrase in @(
    'No common',
    'No mandatory',
    'Existing Working Processes',
    'Existing UI baseline',
    'Passing chain checks',
    'actual usability'
)) {
    if ($hsiGuideSection.Contains($decorativeHsiPhrase)) {
        Add-Failure "HSI/UI decorative English regression: $decorativeHsiPhrase"
    }
}
# These exact known-phrase guards are not a general English-token or clarity oracle.
# Full semantic language review remains required.

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
    'applicable_decision_options',
    'recommended_option_exact_effect',
    'exact Candidate configuration',
    'risk_acceptance',
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
        'decision_confirmation_effects', 'decision actor',
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
        'decision_confirmation_effects', 'decision record'
    ) },
    @{ Name = 'README Decision UI projection'; Text = $readmeText; Markers = @(
        (& $decodeUtf8Marker 'SHVtYW4gR2F0ZSDigJQg0YLQvtGH0LrQsCDRgNC10YjQtdC90LjRjyDRh9C10LvQvtCy0LXQutCw'),
        (& $decodeUtf8Marker 'IyMg0KHRgtCw0YLRg9GB'), (& $decodeUtf8Marker 'IyMg0K3RgtCw0L/RiyDRgNCw0LHQvtGC0Ys='),
        (& $decodeUtf8Marker 'IyMg0KDQtdC60L7QvNC10L3QtNCw0YbQuNGP'), (& $decodeUtf8Marker 'IyMg0JLQsNGA0LjQsNC90YLRiyDRgNC10YjQtdC90LjRjw=='),
        (& $decodeUtf8Marker '0YHQvNGL0YHQuyDRgNC10YjQtdC90LjRjw==')
    ) }
)) {
    foreach ($marker in $locusContract.Markers) {
        if (-not $locusContract.Text.Contains($marker)) {
            Add-Failure "Decision UI per-locus gap: $($locusContract.Name) -> $marker"
        }
    }
}

# Engineering Gate Projection/checklist guards are bounded structural regression evidence only.
# They do not prove actual presentation order, human comprehension, response validity,
# host behavior, correctness, Verification, Admission or release readiness; executed replay remains required.
$engineeringViewsText = Get-Content -Raw -Encoding utf8 -LiteralPath (Join-Path $repoRoot 'catalog/engineering_views/README.md')
$runtimeScenarioText = Get-Content -Raw -Encoding utf8 -LiteralPath (Join-Path $repoRoot 'tests/behavioral/RUNTIME_3_6_OPERATIONAL_SCENARIOS.md')
$gateProjectionMarkers = @(
    'engineering_gate_projection_presented_before_options',
    'runtime_review_checklist_human_empty',
    'checklist_completion_not_admission',
    'links_supplementary_not_presentation'
)
foreach ($gateProjectionContract in @(
    @{ Name = 'AGENTS Gate Projection'; Text = $agentsText; Markers = $gateProjectionMarkers },
    @{ Name = 'Working Process Gate Projection'; Text = $workingGuideText; Markers = @(
        'engineering_gate_projection_presented_before_options', 'runtime_review_checklist_human_empty',
        'checklist_completion_not_admission', 'links_supplementary_not_presentation',
        'gate_projection_gp01_gp11', 'checklist_partial_response_clarifies_unresolved',
        'checklist_drift_regenerates_affected', 'checklist_reentry_recovers_recorded_only'
    ) },
    @{ Name = 'Engineering Views Gate Projection'; Text = $engineeringViewsText; Markers = $gateProjectionMarkers },
    @{ Name = 'Runtime scenario Gate Projection'; Text = $runtimeScenarioText; Markers = @(
        'engineering_gate_projection_presented_before_options', 'runtime_review_checklist_human_empty',
        'checklist_completion_not_admission', 'links_supplementary_not_presentation', 'gate_projection_gp01_gp11'
    ) }
)) {
    foreach ($marker in $gateProjectionContract.Markers) {
        if (-not $gateProjectionContract.Text.Contains($marker)) {
            Add-Failure "Engineering Gate Projection per-locus gap: $($gateProjectionContract.Name) -> $marker"
        }
    }
}

$gpSteps = @([regex]::Matches($workingGuideText, '(?m)^\| `GP-(\d{2}) '))
$gpIds = @($gpSteps | ForEach-Object { $_.Groups[1].Value })
$expectedGpIds = @(1..11 | ForEach-Object { '{0:D2}' -f $_ })
if ($gpIds.Count -ne 11 -or (@($gpIds | Select-Object -Unique).Count -ne 11) -or (($gpIds -join ',') -ne ($expectedGpIds -join ','))) {
    Add-Failure "Gate Projection step sequence is invalid: $($gpIds -join ',')"
}

$ergScenarioMatches = @([regex]::Matches($runtimeScenarioText, '(?m)^\| `ERG-S-(\d{2})` \|'))
$ergScenarioIds = @($ergScenarioMatches | ForEach-Object { $_.Groups[1].Value })
$expectedErgScenarioIds = @(1..20 | ForEach-Object { '{0:D2}' -f $_ })
if ($ergScenarioIds.Count -ne 20 -or (@($ergScenarioIds | Select-Object -Unique).Count -ne 20) -or (($ergScenarioIds -join ',') -ne ($expectedErgScenarioIds -join ','))) {
    Add-Failure "Engineering Gate scenario sequence is invalid: $($ergScenarioIds -join ',')"
}

$irv01Section = [regex]::Match(
    $runtimeScenarioText,
    '(?ms)^### `R36-IRV-01` .*?(?=^### `R36-IRV-|^## `CP-02`)'
).Value
foreach ($requiredIrv01Phrase in @(
    'the same Gate actually presents a smallest sufficient text-complete projection',
    'it then shows a generated exact-configuration checklist with human fields unset',
    'summary, link, filename, hash, bare ID'
)) {
    if (-not $irv01Section.Contains($requiredIrv01Phrase)) {
        Add-Failure "R36-IRV-01 observable Gate Projection contract gap: $requiredIrv01Phrase"
    }
}

# Interaction-clarity markers are bounded structural regression evidence only.
# They do not prove comprehension, usability, Admission or release readiness.
foreach ($clarityContract in @(
    @{ Name = 'AGENTS interaction clarity'; Text = $agentsText; Markers = @(
        'interaction_clarity_russian_first', 'work_stages_generated',
        'applicable_decision_options', 'recommended_option_exact_effect', 'success marker'
    ) },
    @{ Name = 'Bootstrap interaction clarity'; Text = $bootstrapText; Markers = @(
        'interaction_clarity_russian_first', 'work_stages_generated',
        'applicable_decision_options', 'recommended_option_exact_effect'
    ) },
    @{ Name = 'Working Process interaction clarity'; Text = $workingGuideText; Markers = @(
        'semantic categories', 'interaction_clarity_russian_first',
        'work_stages_generated', 'applicable_decision_options',
        'recommended_option_exact_effect', 'decision_confirmation_effects'
    ) },
    @{ Name = 'README interaction clarity'; Text = $readmeText; Markers = @(
        (& $decodeUtf8Marker 'IyMg0KHRgtCw0YLRg9GB'), (& $decodeUtf8Marker 'IyMg0K3RgtCw0L/RiyDRgNCw0LHQvtGC0Ys='),
        (& $decodeUtf8Marker 'IyMg0KDQtdC60L7QvNC10L3QtNCw0YbQuNGP'), (& $decodeUtf8Marker 'IyMg0JLQsNGA0LjQsNC90YLRiyDRgNC10YjQtdC90LjRjw=='),
        (& $decodeUtf8Marker '0Log0YfQtdC80YMg0L/RgNC40LLQtdC00ZHRgiDQutCw0LbQtNGL0Lkg0LLQsNGA0LjQsNC90YI='),
        (& $decodeUtf8Marker '0LrQsNC60L7QtSDQutC+0L3QutGA0LXRgtC90L7QtSDQtNC10LnRgdGC0LLQuNC1INGA0LXQutC+0LzQtdC90LTRg9C10YLRgdGP')
    ) }
)) {
    foreach ($marker in $clarityContract.Markers) {
        if (-not $clarityContract.Text.Contains($marker)) {
            Add-Failure "Interaction clarity per-locus gap: $($clarityContract.Name) -> $marker"
        }
    }
}
if ($readmeText.Contains($legacyRequiredDecision)) {
    Add-Failure 'README retains superseded Required Decision block'
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
    @{ Id = 'S-49'; Markers = @('exact action verb', 'target', 'exact configuration', 'side effects', 'recovery/reversibility', 'Verification', 'accountable action authority') },
    @{ Id = 'S-50'; Markers = @('one-scan target', 'decision-relevant bullets', 'one_recommendation_max_one_details_link', 'justified overflow') }
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
foreach ($readmePreferenceMarker in @(
    '`guided`', '`standard`', '`compact`', '`detailed`', '`milestone`',
    (& $decodeUtf8Marker '0L3QtdC30LDQstC40YHQuNC80L4=')
)) {
    if (-not $readmeText.Contains($readmePreferenceMarker)) {
        Add-Failure "README interaction preference is missing: $readmePreferenceMarker"
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
$runtimeCapabilityTemplatePath = Join-Path $repoRoot 'templates/RUNTIME_CAPABILITY_PROFILE_TEMPLATE.yaml'
$runtimeConformanceProtocolPath = Join-Path $repoRoot 'tests/conformance/RUNTIME_BOUNDARY_CONFORMANCE_PROTOCOL.md'
if (-not (Test-Path -LiteralPath $lessonsTemplatePath -PathType Leaf)) { Add-Failure 'Post-Initiative Lessons template is missing' }
if (-not (Test-Path -LiteralPath $stateTemplatePath -PathType Leaf)) { Add-Failure 'State index template is missing' }
if (-not (Test-Path -LiteralPath $runtimeCapabilityTemplatePath -PathType Leaf)) { Add-Failure 'Runtime Capability Profile template is missing' }
if (-not (Test-Path -LiteralPath $runtimeConformanceProtocolPath -PathType Leaf)) { Add-Failure 'Runtime boundary conformance protocol is missing' }
$lessonsTemplateText = if (Test-Path -LiteralPath $lessonsTemplatePath) { Get-Content -Raw -Encoding utf8 -LiteralPath $lessonsTemplatePath } else { '' }
$stateTemplateText = if (Test-Path -LiteralPath $stateTemplatePath) { Get-Content -Raw -Encoding utf8 -LiteralPath $stateTemplatePath } else { '' }
$runtimeCapabilityTemplateText = if (Test-Path -LiteralPath $runtimeCapabilityTemplatePath) { Get-Content -Raw -Encoding utf8 -LiteralPath $runtimeCapabilityTemplatePath } else { '' }
$runtimeConformanceProtocolText = if (Test-Path -LiteralPath $runtimeConformanceProtocolPath) { Get-Content -Raw -Encoding utf8 -LiteralPath $runtimeConformanceProtocolPath } else { '' }
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

if ($runtimeCapabilityTemplateText) {
    try {
        $runtimeCapabilityTemplate = $runtimeCapabilityTemplateText | ConvertFrom-Json
        if ($runtimeCapabilityTemplate.schema_version -ne '1.1') { Add-Failure 'Runtime Capability Profile schema version gap' }
        if ($runtimeCapabilityTemplate.authority_boundary.capability_grants_authority -ne $false) { Add-Failure 'Runtime Capability Profile authority boundary gap' }
        if (@($runtimeCapabilityTemplate.binding_contract.allowed_conformance_states).Count -ne 4) { Add-Failure 'Runtime Capability Profile conformance-state gap' }
    }
    catch {
        Add-Failure 'Runtime Capability Profile YAML 1.2/JSON projection is invalid'
    }
}
foreach ($runtimeCapabilityMarker in @('semantic_source','runtime_configuration','capability_bindings','declared','enforced','compensated','unsupported','human_gate','honest_stop','profile_admits_result')) {
    if (-not $runtimeCapabilityTemplateText.Contains($runtimeCapabilityMarker)) { Add-Failure "Runtime Capability Profile marker gap: $runtimeCapabilityMarker" }
}
foreach ($runtimeConformanceMarker in @('RC-01','RC-02','RC-03','RC-04','RC-05','RC-06','exact runtime_configuration','actual observation and actual effects','honest_stop','pass_enforced')) {
    if (-not $runtimeConformanceProtocolText.Contains($runtimeConformanceMarker)) { Add-Failure "Runtime conformance protocol marker gap: $runtimeConformanceMarker" }
}

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
    if ($manifestHashRowCount -ne 50) { Add-Failure "Manifest hash row count is $manifestHashRowCount, expected 50" }

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
