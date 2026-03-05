---
entity: "StreamServe (OpenText)"
category: tooling
monitoring_priority: high
last_reviewed: 2026-02-12
monitoring_cadence_days: 14
related_decisions:
  - ADR-018
related_risks:
  - risks/streamserve-incompatible-with-windows-11-requires-replacement.md
---

## Profile

StreamServe is a document output management system (now owned by OpenText). SRX uses it as a back-end IT tool — "no one uses except for IT" — for document generation. It runs on an old DB server in the legacy domain.

## SRX Usage

- **Role**: Back-end document output management (specific documents generated: TBC)
- **Status**: End of practical life — incompatible with Windows 11; old DB server must be replaced
- **Users**: IT team only (no direct end-user interface)

## Signal Log

| Date | Signal | Source | Assessed Impact |
|------|--------|--------|----------------|
| 2026-02-12 | StreamServe confirmed no longer working with Windows 11. Manal Attalla and Karen Lewin discussed need to migrate off old DB server. A team is being engaged to identify an alternative (team name not specified). | IT strategy meeting | High — replacement required; risk to document output capability |

## Replacement Status

- Discussions underway with "one team" (name not recorded in meeting) to find an alternative
- No replacement vendor or product identified as of 2026-02-12
- Not yet prioritised on roadmap — expected to be scheduled after MyInvois and ECN rewrite

## Open Questions

- Which documents does StreamServe currently generate? (Required for impact assessment and replacement scoping)
- Which team is being engaged to find an alternative?
- Is there an OpenText/StreamServe upgrade path to a Windows 11-compatible version?
