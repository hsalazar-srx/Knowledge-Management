---
id: ADR-017
decision: "ECN (Engineer Change Note) rewrite into SM-Portal is the next portal priority after MyInvois, and must include MOVEX API integration for component creation"
status: decided
date: 2026-02-12
reversibility: type-2-reversible
review_date: 2026-04-12
assumptions:
  - "MyInvois Phase 1 ships by Feb 28, 2026, freeing team capacity for ECN work"
  - "Branko's feedback on ECN pain points in Stargile accurately represents product engineering's needs"
  - "MOVEX exposes an MI program suitable for automated component creation (specific program not yet identified)"
  - "SM-Portal is the agreed destination for the ECN rewrite — not a standalone application"
alternatives:
  - "Enhance existing Stargile ECN — rejected because Stargile is painful for engineers and integration with MOVEX APIs is not currently possible in it"
  - "Build standalone ECN application — rejected in favour of putting it into the existing SM-Portal to consolidate portal surface area"
  - "Keep manual MOVEX component entry — rejected as it is the core pain point this project must solve"
dependents:
  - ADR-016
projects:
  - sm-portal-ecn-rewrite
---

## Context

Raised by Karen Lewin in the 2026-02-12 IT strategy meeting. The current ECN process (Engineer Change Note via Stargile) is a known pain point for product engineers — Branko was cited as having expressed this pain. The ECN feature will be rewritten into SM-Portal.

The MOVEX API integration is specifically called out: engineers currently have to manually add new components in MOVEX after raising an ECN. The rewrite will automate this via MOVEX MI API calls, eliminating the manual step.

## Decision

After MyInvois Phase 1 go-live:
1. Begin ECN rewrite, placing it within SM-Portal (not as a standalone app).
2. Rewrite Stage 1 of ECN functionality.
3. Add MOVEX API integration for component creation — the specific MI program must be identified before development begins.

## Open Items

- Which M3 MI program handles component/item creation in MOVEX? (Investigation required — see `m3-knowledge/transactions/`)
- Full scope of "Stage 1" ECN features to be defined with Branko and product engineering team.

## Notes

- "Stargile ECN" is the legacy system being replaced.
- Karen's framing: "rewriting stage one, adding new features like Move X APIs, because they still currently have to go in and add a new component manually in Move X."
