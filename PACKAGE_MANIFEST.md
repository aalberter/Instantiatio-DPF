# Instantiatio DPF 3.7.0 — Engineering Work Runtime · Beta — Package Manifest

## Publication control

| Field | Value |
|---|---|
| Runtime version | `3.7.0` |
| Publication status | `released` |
| Product maturity | `Beta` |
| Assembly date | `2026-08-28` |
| Public identity | `Instantiatio DPF 3.7.0 — Engineering Work Runtime · Beta` |
| Archive identity | `Instantiatio-DPF-3.7.0-Beta.zip` |
| Archive top-level directory | `Instantiatio-DPF-3.7.0-Beta` |
| Canonical repository | `https://github.com/instantiatio/iDPF` |
| License | `MIT`; root `LICENSE` |
| Operational entry | `ENGINEERING_WORK_BOOTSTRAP_GUIDE.md` |
| Process execution guide | `WORKING_PROCESS_AND_LOOPS_GUIDE.md` |
| Dispatcher | `AGENTS.md` |
| Included DPF release | `1.0.1` (`conformance-repaired`, working) |
| Included DPF assembly provenance | `Released 2.2.0` |

Publication status, semantic version and product maturity are separate. This manifest is the authoritative package-level component index; it does not change the authority of included DPF or project-specific carriers. A publication-status value does not itself mean Release Admission or external publication.

## Component versions and authority

| Component | Version | Status | Authoritative locus |
|---|---|---|---|
| Engineering Work Runtime | `3.7.0` | released · Beta | `PACKAGE_MANIFEST.md` and root operational documents |
| AI SDLC DPF | `1.0.1` | controlled working | `AI_SDLC_DPF/framework/AI_SDLC_DPF.md` |
| Bootstrap Guide | `1.10.0` | pilot | `ENGINEERING_WORK_BOOTSTRAP_GUIDE.md` |
| Working Process Guide | `1.12.0` | pilot | `WORKING_PROCESS_AND_LOOPS_GUIDE.md` |
| AGENTS dispatcher | `2.10.0` | pilot | `AGENTS.md` |
| Engineering Review Views | `0.3.0-candidate` | derived review capability | `catalog/engineering_views/` |
| Runtime Capability Profile schema | `1.1` | optional exact-configuration projection | `templates/RUNTIME_CAPABILITY_PROFILE_TEMPLATE.yaml` |
| Model Selection Recommendations | `1.1.0` | admitted informative guidance | `MODEL_SELECTION_RECOMMENDATIONS.md` |
| Reference package assembly | Released Instantiatio DPF Work Kit `3.1.0` + exact component hashes | released | standalone reference/informative carriers; compatible DPF `1.0.1` |
| Combined DPF book | DPF `1.0.1` projection | generated publication view | standalone files under `AI_SDLC_DPF/` remain source loci |
| Historical Quick Start | legacy snapshot | historical / non-operational | `AI_SDLC_DPF/QUICKSTART.md` |

## Compatibility and exclusions

- The Runtime operational entry is Bootstrap-first. `AI_SDLC_DPF/QUICKSTART.md` is historical, non-operational and superseded by the two root execution Guides.
- Distributed repository content covered by the contributors' copyright is available under the standard MIT License in root `LICENSE`; external linked content is not relicensed by this package.
- `https://github.com/instantiatio/iDPF` is the canonical repository identity. Git operations, archive creation and external publication are separate from this released configuration.
- FPF (`https://github.com/ailev/FPF`) is the conceptual foundation. Instantiatio DPF is independent, is not an official FPF distribution and claims no affiliation or endorsement; no external FPF repository files are included or relicensed.
- The release-level identity `Instantiatio DPF 3.6.1 — Engineering Work Runtime · Beta` does not rename or generalize the controlled `AI_SDLC_DPF/**` payload.
- A full project-specific process uses `create_specialized_working_process`.
- Core v2 is not included and is unavailable as an Entry Route. Any external extension requires its own version, applicability, entry contract and authority.
- The complete development-history provenance corpus and governing FPF text are not claimed as distributed files in this package.
- `AI_SDLC_DPF/AI_SDLC_DPF_COMPLETE.md` is a readable projection. Integrity checking compares it with the standalone source loci.
- Interaction and explanation preferences are operational presentation controls. They do not alter authority, assurance, Working Process or Loop semantics, and they do not require changes under `AI_SDLC_DPF/`.
- Model guidance is optional, dated and informative. Model Assignment is host-bounded, belongs to the applicable Working Process/Loop contract and does not alter authority, Verification, Human Gates or Admission.
- Product Engineering Composition is an optional experimental Reference Process realization. It is not a DPF pattern, universal lifecycle, artifact catalogue or project authority.
- New Working Processes use `FC-13-first operational entry`, expand project-relevant result coverage before explicit reductions and preserve admitted reduction/decision trace. Optional PEC remains a selected reference screen; module specialization and lightweight routes are preserved.
- Coverage-first cross-carrier verification remains bounded regression evidence, not semantic proof; material claims retain semantic replay and exact-configuration limitations.
- Runtime `3.6.1 · Beta` is the released product predecessor identity/configuration. Runtime `3.7.0 · Beta` adds ordinary human-friendly entry, routing by established participant information, explicit separation of product accountability, competent engineering review and exact-result Admission authority, affected-only competence mismatch handling, delegated continuation boundaries, progress continuity and minimal effective representation. Codex remains a reference execution host, not a mandatory dependency; Views remain derived, simple reversible work keeps the direct route, and package Verification, package Admission and external publication remain separate evidence/decisions.
- Existing admitted project Working Processes remain valid for their admitted uses. Re-evaluate strengthened concern/guard readiness on a new initiative, new consequential Loop or material process change; do not mass-create PEC carriers.
- The manifest is the exact distributed inventory. Unlisted live `project/**` carriers are project state and are excluded from distribution comparison, while manifest-listed scaffold `.gitkeep` files remain distribution components.
- The package inventory contains exactly `52` hashed files plus this self-unhashed manifest, `53` files total. The current public `3.7.0` Release Notes are fixed at SHA-256 `096C82E7F3849F45CF30BD7CADE63D18775A0FDA554793BB14D58CD4B52E38A2`; predecessor `3.6.1` Notes remain byte-identical at SHA-256 `305C89EEF6BB9EA0D2D7F856504BB7FB34DC4C1F95CAD0805D6D50CFB1D2ED9D`; historical `3.6.0` Notes remain byte-identical at SHA-256 `D123D46B8CD7AD3F6F5E802F8CEED18128E4D93CA7A254BF67F4D520601BDDF8`. Exact archive checksum and external handoff authority are recorded outside the archive; they do not create external publication.
- `.gitattributes` establishes UTF-8/LF-oriented text handling. Normative DPF, Reference Architecture, PAP and historical Quick Start retain declared byte-preserving exceptions and exact hashes.
- The included `AI_SDLC_DPF/` payload remains byte-for-byte the `Released 2.2.0` assembly provenance declared by its controlled README; this provenance is distinct from the Released Instantiatio DPF Work Kit `3.1.0` wrapper identity. The admitted `3.0.0` local release baseline and its `2.5.2` predecessor remain preserved history.

## Known accepted release limitation

At the admitted `3.6.0` release baseline, `AI_SDLC_DPF/reference/AI_SDLC_SOURCES.md` describes the ISO/IEC/IEEE 29148 successor as `CD under development`, while the official public state observed then was ISO/IEC/IEEE DIS 29148 Ed.3, stage `40.00`. The `3.6.0` release authority classified this bounded discrepancy as `accepted_non_blocking`.

Successor publication reopened the issue for `3.7.0`. The exact release-authority disposition is `ISO29148-REL370 = reopened_assessed_nonblocking_for_3_7_0; no external currentness refresh; no successor-status/compliance claim; DPF unchanged; reopen on material applicability/currentness claim, source-maintenance task or next successor publication`. This zero-network release process did not refresh the official state; the controlled local source register is not currentness-qualified for the successor stage. The condition is not a Verification pass and no current successor-status, current-edition superiority, adoption or compliance claim is made.

## SHA-256 component inventory

`PACKAGE_MANIFEST.md` is intentionally not self-hashed. Every other distributed file is listed below.

| Path | Role | SHA-256 |
|---|---|---|
| `.gitattributes` | deterministic text/EOL policy | CA0CABA8A9C922FC3243773CC3A555390AB58962DD48F6143CF1B92BAF231122 |
| `AGENTS.md` | dispatcher | FC383B1CFF582925FA6C93B131D68FC5EA86B30C75D30A59DE484BA22CAAFEA0 |
| `AI_SDLC_DPF/AI_SDLC_DPF_COMPLETE.md` | generated publication view | 57EBD58D7AAA9D1D63461F70025EEA3BE70F7168A3D4CE4BC09765E2287156F3 |
| `AI_SDLC_DPF/examples/AI_SDLC_WORKED_EXAMPLES.md` | informative examples | 257F98C6C9EFE3EE77CA3EFB9E686B10CA5EAF878453F088F7FAC45AAE49DB93 |
| `AI_SDLC_DPF/framework/AI_SDLC_APPLICATION_GUIDE.md` | informative guidance | FE8775074E04ACD080BFC8D029D26F99E1B73ED2E9047DF556E267CDC3FE6C55 |
| `AI_SDLC_DPF/framework/AI_SDLC_DPF.md` | normative DPF locus | A066A09D21AFB199B5910A4E0C54DA50B4CA5FC99290C0E960BDFAF3A9FC532F |
| `AI_SDLC_DPF/framework/AI_SDLC_PRIMARY_APPLICATION_PROFILE.md` | bounded profile | 4846937594A76F4EFE3C12363F048EDB26F4979A914F63C3A48C6AFB2FDCBB2E |
| `AI_SDLC_DPF/framework/AI_SDLC_REFERENCE_ARCHITECTURE.md` | reference architecture | ECFB55C5A43A3F1713ED1B686A29F71C2D5390253FA6CD031BF4F41D3FA75ABD |
| `AI_SDLC_DPF/framework/AI_SDLC_REFERENCE_PROCESS.md` | reference process | 31C0D7BBD2F166038AAAF231DCC44E80DABDEBB3123AA6569FD3D5C2B45C4717 |
| `AI_SDLC_DPF/QUICKSTART.md` | historical non-operational guidance | EA89E1E6414D9AAE8CBF741BCC4C96593FAF570CBF7704BCCBC6220D67BC4172 |
| `AI_SDLC_DPF/README.md` | controlled DPF navigation | B9D625B580953DC40FD5392A5A118B8494DF90A15C3CB5353C47B2FD1CD70B59 |
| `AI_SDLC_DPF/reference/AI_SDLC_GLOSSARY.md` | glossary | 3364BF86B010E8FC6B24B4442A5FB99342199E4D4BC21F148B14E5C91D787E37 |
| `AI_SDLC_DPF/reference/AI_SDLC_GOVERNANCE.md` | DPF governance | EA5143A2F13857D4C88E0215595D382839D34C690ADA35EA2485C154A46C710F |
| `AI_SDLC_DPF/reference/AI_SDLC_OPEN_QUESTIONS.md` | open questions | 62438C39EDF1AB7726A239F9B1DE6C0DAD9E594E983EBCD9FA6BBD6B69BD1ED7 |
| `AI_SDLC_DPF/reference/AI_SDLC_SOURCES.md` | source register | 8A77D11FF2FDC2371391A0D667C9E46C58C9BDA0B35E93AD8DCD365858C50DD9 |
| `AI_SDLC_DPF/reference/AI_SDLC_TRACEABILITY.md` | traceability summary | E466EFA819987F7E9BB8A7B95BD17ADAA9FB739C3ED00CFE3FB917F67AC4777F |
| `catalog/engineering_views/CATALOG.md` | engineering-view catalogue | 9D942D66873F8E44722DD6AD8E5CDAD5F05F178A014734B0979DABF714799C76 |
| `catalog/engineering_views/README.md` | engineering-view selection method | 3BDA6D1735FB0D244E9EEFD87F1D44BFBF48F5FE88E6C44FF30D49383C1FD9F7 |
| `catalog/engineering_views/templates/PROJECT_VIEW_PROFILE.yaml` | optional project-view profile | 79CFDFED1224D5E4EE7ED66E3B1BC0A4B64E8BCBFF7D9E480D98166C21556A28 |
| `catalog/README.md` | modular catalogue navigation | 01699614FFE50CEF57A45CF6E7AF826EFA4C9D50D51BA16470ADE26ACBDCD7DC |
| `catalog/working_process_compositions/CATALOG.md` | process-composition catalogue | BA453CE9A92AD1AF11569B5A3166EB5E60256CDAED6ACDA495E600CBA6DEDA24 |
| `catalog/working_process_compositions/README.md` | process-composition selection method | 7BCE2F38A2692DF75D69517A924538ADD8557F2B3800E504735B676E609975C0 |
| `catalog/working_process_compositions/templates/WORKING_PROCESS_COMPOSITION_RECORD.yaml` | optional composition record | 614F3DC3F33A7C13E0ACCE014F769357247C185C32B3A104BE8AC2DF9F11F8DA |
| `docs/DPF_FORMATION_METHOD.md` | reference/provenance method | 93E6D1D1F4EB9F13B2F51656DE7E6B3D7D2782324D1103AE2BE43E15C700D744 |
| `docs/DPF_FORMATION_REFERENCE.md` | formation reference | 723E3D9959265995C69F1271ACF2E0429C369B7C080A09B9B0538D5FA3E31AB2 |
| `docs/KIT_EVOLUTION_ROADMAP.md` | roadmap | 07E1413ADC4710A31F3737490BACFECEC304C6EB5E618EB3F3C90E19D260AAD7 |
| `docs/releases/RELEASE_NOTES_3_2_0.md` | 3.2.0 release notes | DB8F0F2810B2E7A3EC1BEFE4B852914DA13712B573E9D36DE01F6747840F0D18 |
| `docs/releases/RELEASE_NOTES_3_3_0.md` | 3.3.0 Beta release notes | 0BCC30AC781AE59F1CDD08FDCD2FCB7FF02F5465D18EB429BC7E8252A7E4C9E2 |
| `docs/releases/RELEASE_NOTES_3_4_0.md` | 3.4.0 Beta release notes | DEEEDE3E869E08425101B318570E7A8DB4510C1D4EE12C5769DDCD83A6DE91C8 |
| `docs/releases/RELEASE_NOTES_3_5_0.md` | 3.5.0 Beta release notes | C3754F80199F8034EF0856EEEF2A4A0A04E1E50976D3417A17FBE23A265A598D |
| `docs/releases/RELEASE_NOTES_3_6_0.md` | 3.6.0 Beta release notes | D123D46B8CD7AD3F6F5E802F8CEED18128E4D93CA7A254BF67F4D520601BDDF8 |
| `docs/releases/RELEASE_NOTES_3_6_1.md` | 3.6.1 Beta release notes | 305C89EEF6BB9EA0D2D7F856504BB7FB34DC4C1F95CAD0805D6D50CFB1D2ED9D |
| `docs/releases/RELEASE_NOTES_3_7_0.md` | 3.7.0 Beta release notes | 096C82E7F3849F45CF30BD7CADE63D18775A0FDA554793BB14D58CD4B52E38A2 |
| `ENGINEERING_WORK_BOOTSTRAP_GUIDE.md` | Bootstrap method | 11B3CB11F2DC7729C6C134C398C820A17B0A57440BDE63C61DB7BAE75B0E4F35 |
| `examples/CODEX_REFERENCE_CAPABILITY_PROFILE.yaml` | dated Codex reference capability profile | F6965322FD6DEFA84830C0A2B3C58CB0A1E26BBE3E9F8DD6841575A071A5EB29 |
| `LICENSE` | MIT license | EF4DA070E506CD1018F449FC78BAE57537B96F797264CF56F133E411B5B611EC |
| `MODEL_SELECTION_RECOMMENDATIONS.md` | admitted informative model guidance | 764B43344ED81983C6725BB7993650915BA8E5287E68F6FC790822C229F95431 |
| `project/artifacts/.gitkeep` | empty project scaffold | 7EB70257593DA06F682A3DDDA54A9D260D4FC514F645237F5CA74B08F8DA61A6 |
| `project/source/.gitkeep` | empty project scaffold | 75A11DA44C802486BC6F65640AA48A730F0F684C5C07A42BA3CD1735EB3FB070 |
| `project/src/.gitkeep` | empty project scaffold | 7EB70257593DA06F682A3DDDA54A9D260D4FC514F645237F5CA74B08F8DA61A6 |
| `project/tests/.gitkeep` | empty project scaffold | 7EB70257593DA06F682A3DDDA54A9D260D4FC514F645237F5CA74B08F8DA61A6 |
| `README.md` | package entry and navigation | EB3F3A089C53FCE91134514519A3558F6A257B39BD447DC1BFFB7426484EE970 |
| `scripts/check_integrity.ps1` | integrity automation | D015FD983A5134002B8A647CA6768D1FF547A18E4DA234104343A9D1EE014A94 |
| `templates/CONSOLIDATED_AUTHORITY_PACKAGE_TEMPLATE.md` | reusable bounded authority package | DD70C8B81EF02D2029B953D6BFDCEB45E589BB02C11A868D99E3818F28F87058 |
| `templates/POST_INITIATIVE_LESSONS_REVIEW_TEMPLATE.md` | reusable post-initiative review | 3E84967F5AD4AFA442273CAFB15407EC5B397CA7B54D057096E63BEC4121A8B6 |
| `templates/RUNTIME_CAPABILITY_PROFILE_TEMPLATE.yaml` | optional exact-configuration capability projection | 757E997A07DFCBE7CCD5B479CFD1BB48D86E355D9127A19EBB37D1E2CB991BDC |
| `templates/STATE_INDEX_TEMPLATE.yaml` | optional state projection template | 68473096F407907A08D1B1121EDB2A152F4D68BB590B093A62E4A3D56A75BC76 |
| `tests/behavioral/BOOTSTRAP_SCENARIOS.md` | behavioral acceptance contract | 6518ED445A02FE04C8DE170FF0F67A575054E6B934A8690C41F69B93E1622796 |
| `tests/behavioral/RUNTIME_3_6_OPERATIONAL_SCENARIOS.md` | Runtime 3.6 operational acceptance contract | DCEBA99850AC484A7FC5E0F85520B09EAC43A56B194E311C5C078A7247C08BFC |
| `tests/behavioral/RUNTIME_3_7_OPERATIONAL_SCENARIOS.md` | Runtime 3.7 operational acceptance contract | CCB6E63E612F49325D02C9D050B7DC6FBEF36080D95EE94FBD5693F76E8E36F4 |
| `tests/conformance/RUNTIME_BOUNDARY_CONFORMANCE_PROTOCOL.md` | exact-configuration conformance protocol | AD355CB8148EDE2D7BDE0F6458E5A5699223CA86E2566E2CCD0EAFD082A5C9BE |
| `WORKING_PROCESS_AND_LOOPS_GUIDE.md` | process method | 42E39ACD4AC088AC443534A9758D03F913B383E0410BEAC7AB28DCD32C2AA7A9 |

## Verification command

On Windows PowerShell:

```powershell
powershell.exe -NoProfile -ExecutionPolicy Bypass -File .\scripts\check_integrity.ps1
```

The command verifies UTF-8, declared LF/EOL exceptions, the exact MIT LICENSE, Runtime `3.7.0 · Beta` package identity, current and historical Release Notes identity, FPF/public-boundary markers, one authoritative root AGENTS entry, bounded live Markdown links and anchors, operational placeholders, required files, DPF pattern/sentinel counts, exact continuous `S-1`–`S-204`, Runtime 3.6 and 3.7 operational scenarios, human-interaction/routing/progress markers, Decision UI and Engineering Gate Projection/review-checklist guards, capability-profile/conformance contracts, coverage-first mappings, model-guidance and PEC semantics, standalone/combined-publication parity, DPF assembly provenance, distributed/live-project separation and the exact `52`-row hash inventory. Marker checks remain bounded regression evidence; semantic replay, independent review, final package Admission and external publication remain separate.
