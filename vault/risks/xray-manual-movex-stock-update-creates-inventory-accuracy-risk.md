---
risk: "Xray machine stock movements are manually transcribed into MOVEX by Sandra, creating inventory accuracy and single-point-of-failure risk"
category: operational
likelihood: high
impact: moderate
status: active
reviewed: 2026-01-21
early_warnings:
  - "Sandra absent or unavailable — MOVEX stock updates for Xray-processed materials stop"
  - "Inventory counts for Xray-processed components show discrepancies between MOVEX and physical stock"
  - "Delays between Xray processing and MOVEX update observed (data latency)"
  - "MES reel data is described as inaccurate — possibly connected to this manual entry gap"
mitigations:
  - "Integrate Xray machine to write stock movements directly to MOVEX (TODO assigned in 2026-01-21 meeting)"
  - "Interim: define a backup person for Sandra to cover manual MOVEX entry during absence"
  - "Map the Xray → Sandra → MOVEX data flow in detail before automating, to ensure all fields are captured correctly"
contingency:
  - "If Xray integration is delayed: formalise the manual process and create a documented runbook for Sandra's coverage"
  - "If stock accuracy is impacted before fix: run an Xray stock reconciliation against MOVEX"
---

## Context

Identified in the 2026-01-21 Melbourne SMS/MES session. The group established that MOVEX must be the single source of truth for stock balances (ADR-020). The Xray machine was specifically cited as a peripheral system whose stock movements are currently entered into MOVEX manually by Sandra — a single-person dependency.

This was raised as a TODO: *"Xray needs to update directly MOVEX to avoid manual entering from Sandra."*

## Related

- Decision ADR-020: MOVEX as single source of truth for stock balances
- Risk: `mes-procedure-expiry-dates-not-aligned-with-scanfil.md` (parallel MES compliance issue)
