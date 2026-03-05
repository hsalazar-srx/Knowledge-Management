---
id: ADR-020
decision: "MOVEX is the single source of truth for stock balances; all other systems must write to MOVEX rather than maintaining their own stock state"
status: decided
date: 2026-01-21
reversibility: type-1-irreversible
review_date: 2026-04-21
assumptions:
  - "MOVEX has the API/integration capability to receive stock updates from peripheral systems such as Xray machines"
  - "Peripheral systems (MES, Xray, etc.) can be configured or modified to push stock movements directly to MOVEX"
  - "Staff who currently perform manual MOVEX stock entries (e.g. Sandra for Xray data) are available to support the transition"
  - "MES stock data is currently unreliable (reels not accurate) and must be corrected before being trusted"
alternatives:
  - "Allow MES to maintain its own stock state and sync periodically — rejected because dual-source creates reconciliation problems and the MES DB has known accuracy issues with reels"
  - "Continue with manual entry (Sandra entering Xray data into MOVEX) — rejected as a permanent solution due to single-point-of-failure risk and data delay"
dependents:
  - ADR-014
projects:
  - sourcing-kpis-scanfil
---

## Context

Raised in the 2026-01-21 Melbourne visit SMS/MES working session. The group identified that the MES database was unreliable — reel data was not accurate. The consensus was that MOVEX must be the authoritative record for stock balances, and that peripheral systems (MES, Xray machines) must write directly to MOVEX rather than maintaining separate stock state.

Specifically, the Xray machine was identified as writing stock movements that Sandra then manually transcribes into MOVEX — a fragile single-point-of-failure process.

## Decision

- **MOVEX is the single source of truth for all stock balance data.**
- Systems that generate stock movements (MES, Xray, etc.) must be integrated to update MOVEX directly.
- Manual transcription of machine data into MOVEX is not an acceptable permanent process.
- The MES database must be cleaned before it can be trusted for any reporting purposes.

## Implications

- Xray machine integration to MOVEX is a required development item (TODO captured from meeting).
- MES database cleanup is a prerequisite before MES data can be used in reporting.
- This decision reinforces the data architecture in ADR-014 (MOVEX as data source for Fabric/Power BI).
