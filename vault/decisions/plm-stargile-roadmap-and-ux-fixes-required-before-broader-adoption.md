---
id: ADR-023
decision: "PLM (Stargile) requires a documented roadmap and UX fixes before broader adoption can be expected; current state is blocking usage"
status: decided
date: 2026-01-21
reversibility: type-2-reversible
review_date: 2026-03-22
assumptions:
  - "PLM (Stargile) is the designated system for BOM management and PLM processes at SRX — it is not being replaced in the near term"
  - "UX issues (missing progress bars, unclear interface, questionable results) are fixable within the current Stargile platform"
  - "A Teams-based PLM Roadmap can align stakeholders on what will be fixed and when, improving trust and adoption"
  - "BOM comparison with MOVEX is the most-used and most-valued PLM feature — it should be prioritised in the roadmap"
alternatives:
  - "Replace Stargile with a different PLM system — not discussed; current scope is roadmap and UX improvements"
  - "Continue current usage levels without a roadmap — rejected because explicit feedback confirmed PLM is underused due to trust and UX issues; drift will worsen without intervention"
dependents: []
projects:
  - plm-stargile-bom
---

## Context

Raised in the 2026-01-21 Melbourne Stargile/PLM/BOM session with Branko, NickN, and others. The group explicitly identified that PLM is "not used that much as it should or could be used" due to: questionable results, unfriendly interface, and missing progress indicators.

A **Teams PLM Roadmap** was identified as a TODO action to align the team on what needs to be fixed.

## Known Issues (from 2026-01-21 session)

| # | Issue |
|---|-------|
| 1 | Interface is not user-friendly |
| 2 | Missing progress bars — users don't know if an operation is running |
| 3 | Results are questionable — trust is low |
| 4 | Word wrapping missing in BOM comparison view |
| 5 | No legend for colour coding (green = new part, red = removed part) |
| 6 | MPN field — string splitting not implemented |
| 7 | MPN field length limited to 30 characters — needs to be increased |

## What Works

- BOM comparison with MOVEX **does work** when both BOMs come from MOVEX (IPN matching)
- DigiKey descriptions match MOVEX descriptions — integration path exists

## BOM Comparison Logic (documented 2026-01-21)

For new BOM comparison:
- If customer has Alias or CPN (Customer Part Number) → use CPN first
- If no CPN → use MPN (Manufacturer Part Number) second
- MPN comparison: full match → partial match → no match (three-tier result)
- Part Number (PN) rules: first step is always to get the latest available number from MOVEX
- Descriptions must be standardised (currently inconsistent)

## Technical Notes

- BOM replication job: `PDPBom` — runs on server `10.40.10.42`
- Trigger cadence being discussed: every 2 hours (10, 12, 14, 16, 18 hrs)
- Part revision updates: manual via `PDS001` (see `m3-knowledge/transactions/pds001-part-revision-manual-update.md`)
- MPN source: MOVEX Datawarehouse (until replication runs)
- Reducing manual entries is a secondary goal — fewer manual steps reduces rotation personnel dependency
