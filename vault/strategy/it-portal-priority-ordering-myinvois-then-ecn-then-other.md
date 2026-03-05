---
claim: "IT portal project delivery is sequenced: MyInvois first (regulatory), then ECN rewrite (engineering pain point), then remaining SM-Portal features"
status: active
date: 2026-02-12
owner: "Karen Lewin (SRX Global IT)"
last_reviewed: 2026-02-12
next_review: 2026-05-12
supporting_decisions:
  - decisions/myinvois-is-current-top-priority-portal-project.md
  - decisions/ecn-rewrite-is-next-portal-priority-after-myinvois-with-movex-api-integration.md
falsified_by:
  - "A new regulatory or contractual deadline creates a higher-urgency portal project"
  - "MyInvois Phase 1 is delayed significantly, causing the ECN rewrite to be pulled forward"
  - "Business stakeholders override Karen's priority ordering via executive escalation"
---

## Claim

SRX IT portal projects are delivered in the following order:
1. **MyInvois** — LHDN regulatory compliance, go-live Feb 28, 2026 (non-negotiable)
2. **ECN (Engineer Change Note) rewrite** — SM-Portal, Stage 1, with MOVEX API integration
3. Remaining SM-Portal features (not yet prioritised as of 2026-02-12)

## Rationale

MyInvois is driven by an external regulatory deadline (LHDN mandate). ECN rewrite follows because:
- It is the highest-pain internal project (Branko / product engineering feedback)
- It enables automation of a currently manual MOVEX step

## Known Constraints

- StreamServe replacement is a separate workstream, not yet on the portal roadmap.
- B2BE upgrade/replacement is under early consideration — not on the near-term roadmap.
- Domain migration (Manal Attalla) runs in parallel with portal delivery, not sequenced with it.

## Drift Signals

Watch for:
- Commits in SM-Portal or other portal projects appearing before MyInvois go-live confirmation
- ECN rewrite work starting before MyInvois Phase 1 is closed
- New portal feature requests being escalated above ECN in priority
