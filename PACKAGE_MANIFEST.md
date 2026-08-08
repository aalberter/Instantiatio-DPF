# Instantiatio DPF — Engineering Work Kit Package Manifest

## Publication control

| Field | Value |
|---|---|
| Kit version | `3.0.0` |
| Publication status | `released` |
| Assembly date | `2026-08-08` |
| Public identity | `Instantiatio DPF — Engineering Work Kit` |
| Canonical repository | `https://github.com/aalberter/Instantiatio-DPF` |
| License | `MIT`; root `LICENSE` |
| Operational entry | `ENGINEERING_WORK_BOOTSTRAP_GUIDE.md` |
| Process execution guide | `WORKING_PROCESS_AND_LOOPS_GUIDE.md` |
| Dispatcher | `AGENTS.md` |
| Included DPF release | `1.0.1` (`conformance-repaired`, working) |
| Included DPF assembly provenance | `Released 2.2.0` |

Publication status is separate from semantic versioning. This manifest is the authoritative package-level component index; it does not change the authority of included DPF or project-specific carriers.

## Component versions and authority

| Component | Version | Status | Authoritative locus |
|---|---|---|---|
| Engineering Work Kit | `3.0.0` | released | `PACKAGE_MANIFEST.md` and root operational documents |
| AI SDLC DPF | `1.0.1` | controlled working | `AI_SDLC_DPF/framework/AI_SDLC_DPF.md` |
| Bootstrap Guide | `1.5.1` | pilot | `ENGINEERING_WORK_BOOTSTRAP_GUIDE.md` |
| Working Process Guide | `1.5.2` | pilot | `WORKING_PROCESS_AND_LOOPS_GUIDE.md` |
| AGENTS dispatcher | `2.5.0` | pilot | `AGENTS.md` |
| Model Selection Recommendations | `1.0.0` | admitted informative guidance | `MODEL_SELECTION_RECOMMENDATIONS.md` |
| Reference package assembly | Released Instantiatio DPF Work Kit `3.0.0` + exact component hashes | released | standalone reference/informative carriers; compatible DPF `1.0.1` |
| Combined DPF book | DPF `1.0.1` projection | generated publication view | standalone files under `AI_SDLC_DPF/` remain source loci |
| Historical Quick Start | legacy snapshot | historical / non-operational | `AI_SDLC_DPF/QUICKSTART.md` |

## Compatibility and exclusions

- The Work Kit operational entry is Bootstrap-first. `AI_SDLC_DPF/QUICKSTART.md` is historical, non-operational and superseded by the two root execution Guides.
- Distributed repository content covered by the contributors' copyright is available under the standard MIT License in root `LICENSE`; external linked content is not relicensed by this package.
- `https://github.com/aalberter/Instantiatio-DPF` is the canonical repository identity. External repository creation or publication is separate from this Candidate configuration.
- FPF (`https://github.com/ailev/FPF`) is the conceptual foundation. Instantiatio DPF is independent, is not an official FPF distribution and claims no affiliation or endorsement; no external FPF repository files are included or relicensed.
- The release-level identity `Instantiatio DPF` does not rename or generalize the controlled `AI_SDLC_DPF/**` payload.
- A full project-specific process uses `create_specialized_working_process`.
- Core v2 is not included and is unavailable as an Entry Route. Any external extension requires its own version, applicability, entry contract and authority.
- The complete development-history provenance corpus and governing FPF text are not claimed as distributed files in this package.
- `AI_SDLC_DPF/AI_SDLC_DPF_COMPLETE.md` is a readable projection. Integrity checking compares it with the standalone source loci.
- Interaction and explanation preferences are operational presentation controls. They do not alter authority, assurance, Working Process or Loop semantics, and they do not require changes under `AI_SDLC_DPF/`.
- Model guidance is optional, dated and informative. Model Assignment is host-bounded, belongs to the applicable Working Process/Loop contract and does not alter authority, Verification, Human Gates or Admission.
- Product Engineering Composition is an optional experimental Reference Process realization. It is not a DPF pattern, universal lifecycle, artifact catalogue or project authority.
- New Working Processes use `FC-13-first operational entry`, expand project-relevant result coverage before explicit reductions and preserve admitted reduction/decision trace. Optional PEC remains a selected reference screen; module specialization and lightweight routes are preserved.
- Coverage-first cross-carrier verification and fresh independent challenge concluded `pass_with_limitations`. `R1-IC-O01` remains explicit: exact marker/order automation is bounded regression evidence, not semantic proof; material verification retains semantic replay.
- Released Work Kit `3.0.0` adds the `Instantiatio DPF` release-level identity, standard MIT license and lightweight README public/provenance layer over the admitted local `2.5.2` predecessor. The controlled DPF and operational/behavioral semantics remain unchanged. Released metadata in a staged package does not self-admit an archive and does not claim native Codex controls, field-proven usability or external repository publication.
- Existing admitted project Working Processes remain valid for their admitted uses. Re-evaluate strengthened concern/guard readiness on a new initiative, new consequential Loop or material process change; do not mass-create PEC carriers.
- The manifest is the exact distributed inventory. Unlisted live `project/**` carriers are project state and are excluded from distribution comparison, while manifest-listed scaffold `.gitkeep` files remain distribution components.
- `.gitattributes` establishes UTF-8/LF-oriented text handling. Normative DPF, Reference Architecture, PAP and historical Quick Start retain declared byte-preserving exceptions and exact hashes.
- The included `AI_SDLC_DPF/` payload remains byte-for-byte the `Released 2.2.0` assembly provenance declared by its controlled README; this provenance is distinct from the Released Instantiatio DPF Work Kit `3.0.0` wrapper identity. The admitted local `2.5.2`, Released Work Kit `2.4.0` and admitted `2.3.0` archives remain preserved predecessor baselines.

## Known accepted release limitation

At the admitted release baseline, `AI_SDLC_DPF/reference/AI_SDLC_SOURCES.md` describes the ISO/IEC/IEEE 29148 successor as `CD under development`, while its official public state was ISO/IEC/IEEE DIS 29148 Ed.3, stage `40.00`. ISO/IEC/IEEE 29148:2018 remained the current published/adopted baseline. The release authority classified this bounded currentness discrepancy as `accepted_non_blocking`; it is not silently corrected or represented as a pass. Successor publication, material applicability or claim change, or an authorized source-maintenance correction reopens the issue and affected verification.

## SHA-256 component inventory

`PACKAGE_MANIFEST.md` is intentionally not self-hashed. Every other distributed file is listed below.

| Path | Role | SHA-256 |
|---|---|---|
| `.gitattributes` | deterministic text/EOL policy | CA0CABA8A9C922FC3243773CC3A555390AB58962DD48F6143CF1B92BAF231122 |
| `AGENTS.md` | dispatcher | FE6DEF13FA141770E6E95CB60755B5327C9007E0FDF0FAC20D7550C4A16F2C9B |
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
| `docs/DPF_FORMATION_METHOD.md` | reference/provenance method | 93E6D1D1F4EB9F13B2F51656DE7E6B3D7D2782324D1103AE2BE43E15C700D744 |
| `docs/DPF_FORMATION_REFERENCE.md` | formation reference | 723E3D9959265995C69F1271ACF2E0429C369B7C080A09B9B0538D5FA3E31AB2 |
| `docs/KIT_EVOLUTION_ROADMAP.md` | roadmap | 175AB4EAABB32F672AD55CF0CB03D6EAD2F2AB03609C03AEDCDB72CFE1FD0D65 |
| `ENGINEERING_WORK_BOOTSTRAP_GUIDE.md` | Bootstrap method | A09B8FD82AF2C66B4AB421D5E66DA8360ADD9B90844B7512B09EF6D430AB9DE9 |
| `LICENSE` | MIT license | EF4DA070E506CD1018F449FC78BAE57537B96F797264CF56F133E411B5B611EC |
| `MODEL_SELECTION_RECOMMENDATIONS.md` | admitted informative model guidance | B24316042A8A2D08CEFF8221807026572010E1073E78E5A5084F2D5CC1993FD2 |
| `project/artifacts/.gitkeep` | empty project scaffold | 7EB70257593DA06F682A3DDDA54A9D260D4FC514F645237F5CA74B08F8DA61A6 |
| `project/source/.gitkeep` | empty project scaffold | 7EB70257593DA06F682A3DDDA54A9D260D4FC514F645237F5CA74B08F8DA61A6 |
| `project/src/.gitkeep` | empty project scaffold | 7EB70257593DA06F682A3DDDA54A9D260D4FC514F645237F5CA74B08F8DA61A6 |
| `project/tests/.gitkeep` | empty project scaffold | 7EB70257593DA06F682A3DDDA54A9D260D4FC514F645237F5CA74B08F8DA61A6 |
| `README.md` | package entry and navigation | E25C7E9788CA53EA1F9BC75D42EA3D035B996B686FE0660F3291B0B90E7A6C4F |
| `scripts/check_integrity.ps1` | integrity automation | 4E0824063C7969CA0122D0F58ACED48F277457B1288878FF2CD46C8CFEFE3011 |
| `tests/behavioral/BOOTSTRAP_SCENARIOS.md` | behavioral acceptance contract | DB22E65340D4FB4A45CD5B25BE864CD65674783B744E880F664454212BF599DD |
| `WORKING_PROCESS_AND_LOOPS_GUIDE.md` | process method | 3B34F9D29B5BA601BC5328A6839E400B3ACEB28FB8133748F64C4AC4F96C6FBE |

## Verification command

On Windows PowerShell:

```powershell
powershell.exe -NoProfile -ExecutionPolicy Bypass -File .\scripts\check_integrity.ps1
```

The command verifies UTF-8, declared LF/EOL exceptions, the exact MIT LICENSE, release-level identity and FPF/public-boundary markers, one authoritative root AGENTS entry, bounded live Markdown links and anchors, operational placeholders, required files, DPF pattern/sentinel counts, 50 behavioral scenarios, Decision UI WPC-06-section/per-field and per-scenario specialization guards, coverage-first mappings, model-guidance and PEC guard semantics, standalone/combined-publication parity, DPF assembly provenance, distributed/live-project separation and this hash inventory. Marker checks remain bounded regression evidence; semantic replay remains required.
