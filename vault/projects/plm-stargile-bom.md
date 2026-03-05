---
project: "PLM — Stargile BOM Management and Comparison"
status: active
phase: "UX improvement and roadmap definition"
go_live: null
owner: "NickN / Branko (Product Engineering)"
key_decisions:
  - ADR-023
open_risks:
  - plm-low-adoption-creates-bom-data-quality-risk
stakeholders:
  - "Branko — Product Engineering (primary PLM user, BOM comparison)"
  - "NickN — PLM development lead"
  - "Karen Lewin — SRX Global IT (Business Applications)"
  - "Bryan Fu — GRB factory (BOM upload into Stargile)"
---

## Objective

Improve Stargile PLM adoption and reliability for BOM management. Core functions in scope:

1. BOM upload and verification (new BOMs from customers)
2. BOM comparison (customer BOMs vs MOVEX BOMs)
3. New part number creation workflow
4. RFQ and communication channel with customers

## Current Pain Points (identified 2026-01-21)

1. Getting BOM data from customers
2. Email and RFQ processes not done properly
3. RFQ not being used by CBMs (Customer Business Managers)
4. QCW template for pricing not standardised
5. Approval process for new BOMs is unclear
6. Customer communication channel — moved from NPI DB to Teams (improvised)
7. PLM interface is not user-friendly; missing progress bars; results not fully trusted
8. BOM comparison has no legend, word wrapping issues, MPN field limitations

## What is Working

- BOM comparison with MOVEX works when both BOMs originate from MOVEX (IPN matching)
- DigiKey descriptions align with MOVEX descriptions
- Part number creation rules exist (get latest PN from MOVEX first)

## Technical Architecture

| Component | Detail |
|-----------|--------|
| PLM system | Stargile |
| BOM replication job | `PDPBom` on `10.40.10.42` |
| Replication cadence (proposed) | Every 2 hours: 10, 12, 14, 16, 18 hrs |
| MPN source | MOVEX Datawarehouse (until replication) |
| Part revision updates | Manual via `PDS001` in MOVEX |
| PN comparison | Full match → partial match → no match (three-tier) |

## Open Items

- [ ] Create Teams PLM Roadmap (TODO from 2026-01-21 — owner: NickN)
- [ ] Fix MPN string splitting in Stargile
- [ ] Increase MPN field length beyond 30 characters
- [ ] Add progress bars to PLM interface
- [ ] Add legend to BOM comparison colour coding
- [ ] Fix word wrapping in BOM comparison
- [ ] Standardise part description format
- [ ] Formalise customer communication channel (replace improvised Teams approach)
- [ ] Formalise RFQ usage by CBMs
- [ ] Clarify approval process for new BOMs

## Status History

- 2026-01-20: Nick raised BOM template upload into Stargile and restarting PLM++ at Melbourne visit
- 2026-01-21: Full PLM/BOM session with Branko and NickN — pain points catalogued
