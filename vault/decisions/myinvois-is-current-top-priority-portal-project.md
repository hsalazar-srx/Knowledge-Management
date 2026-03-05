---
id: ADR-016
decision: "MyInvois is the current top-priority portal project and must be completed before other portal work proceeds"
status: decided
date: 2026-02-12
reversibility: type-2-reversible
review_date: 2026-04-12
assumptions:
  - "LHDN regulatory deadline remains the binding constraint driving MyInvois to top priority"
  - "No other portal project has a regulatory or contractual deadline that supersedes LHDN compliance"
  - "MyInvois Phase 1 go-live (Feb 28, 2026) is achievable within the current sprint"
alternatives:
  - "ECN rewrite first — rejected because MyInvois has a regulatory deadline (LHDN mandate) while ECN is a pain-point priority without an external deadline"
  - "Parallel execution of MyInvois and ECN rewrite — rejected implicitly; team capacity requires sequential focus"
dependents:
  - ADR-013
projects:
  - MyInvois-Service
---

## Context

Raised explicitly by Karen Lewin in the 2026-02-12 IT strategy meeting: "My invoice? Because that's our urgent priority."

MyInvois-Service is a regulatory compliance project with an LHDN mandated go-live deadline of 2026-02-28. All other portal work (ECN rewrite, other SM-Portal features) is deferred until MyInvois Phase 1 ships.

## Decision

MyInvois-Service Phase 1 remains the top priority for the IT portals team. No new portal feature development begins until Phase 1 go-live is complete.

## Notes

- This decision is consistent with the active project status in `projects/myinvois-phase1.md`.
- Next priority after MyInvois is the ECN Engineer Change Note rewrite — see ADR-017.
