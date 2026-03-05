---
entity: "Stargile"
category: tooling
monitoring_priority: medium
last_reviewed: 2026-01-21
monitoring_cadence_days: 30
---

## Overview

Stargile is the PLM (Product Lifecycle Management) system used at SRX for BOM management, BOM comparison, and engineering change management. It is the system being partially migrated away from — ECN functionality is being moved to SM-Portal — but Stargile remains active for BOM comparison and PLM functions.

## Current Usage at SRX

- BOM upload and verification (new customer BOMs)
- BOM comparison (customer BOMs vs MOVEX BOMs)
- Part number management and creation workflows
- Engineering Change Note (ECN) processing (being migrated to SM-Portal — ADR-017)

## Signal Log

| Date | Source | Signal | Assessed Impact |
|------|--------|--------|----------------|
| 2026-01-21 | Melbourne PLM session (Branko, NickN, Karen) | PLM not being used as much as it should — interface not user-friendly, missing progress bars, questionable results, trust issues | High — BOM data quality risk if workarounds entrenched |
| 2026-01-21 | Melbourne PLM session | MPN field limited to 30 characters — needs extension | Medium — data truncation on manufacturer part numbers |
| 2026-01-21 | Melbourne PLM session (NickN) | Teams PLM Roadmap identified as TODO to communicate planned fixes | Medium — user confidence depends on roadmap communication |
| 2026-01-21 | Melbourne meeting (Nick) | Restarting PLM++ mentioned — indicates PLM development work resuming | Medium — direction of PLM investment needs tracking |

## Technical Notes

- BOM replication job: `PDPBom` — runs on `10.40.10.42`
- Part revision updates via MOVEX: `PDS001`
- BOM comparison with MOVEX works when both BOMs originate in MOVEX (IPN matching)

## Related

- Decision ADR-023: PLM Stargile roadmap and UX fixes required
- Project: `projects/plm-stargile-bom.md`
- Project: `projects/sm-portal-ecn-rewrite.md` (ECN migration out of Stargile)
- Risk: `risks/plm-low-adoption-creates-bom-data-quality-risk.md`
