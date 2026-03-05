---
risk: "MES procedure expiry dates are not aligned with the Scanfil standard, causing operating procedures to silently expire"
category: operational
likelihood: high
impact: moderate
status: active
reviewed: 2026-01-21
early_warnings:
  - "MES prompts or warnings about expired procedures are ignored or unaddressed"
  - "Procedures appearing in MES with past expiry dates — Mihai confirmed this is becoming a problem"
  - "Scanfil audit or integration review flags procedure management as non-compliant"
  - "Production staff operating on expired documented procedures"
mitigations:
  - "Mihai to update MES expiry date handling to align with Scanfil's procedure management standard (TODO from 2026-01-21)"
  - "Audit current MES procedures for expired items and either renew or retire them"
  - "Establish a recurring review cadence for MES procedures aligned to Scanfil standard"
contingency:
  - "If procedures have already expired: freeze changes to those procedures and escalate to Mihai / production management for emergency renewal"
  - "If Scanfil audit occurs before fix: document the known gap and the remediation timeline"
---

## Context

Raised in the 2026-01-21 Melbourne DISP/Devian session. Mihai had previously registered this issue. The MES (Manufacturing Execution System) procedure expiry dates are not configured to align with how Scanfil manages procedure lifecycles. As a result, operational procedures in MES are expiring without being caught and renewed. This is described as "becoming a problem."

Mihai was identified as the action owner to fix the expiry date alignment.

## Related

- Risk: `xray-manual-movex-stock-update-creates-inventory-accuracy-risk.md` (parallel MES/stock data quality issue)
- Decision ADR-020: MOVEX as single source of truth for stock balances
