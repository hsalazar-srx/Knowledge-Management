---
project: "SM-Portal — ECN Engineer Change Note Rewrite"
status: planning
phase: "Pre-development — awaiting MyInvois Phase 1 go-live"
go_live: null
owner: "Hector Salazar (SRX Global IT)"
key_decisions:
  - decisions/ecn-rewrite-is-next-portal-priority-after-myinvois-with-movex-api-integration.md
  - decisions/myinvois-is-current-top-priority-portal-project.md
open_risks: []
stakeholders:
  - "Karen Lewin — SRX Global IT (Business Applications, project sponsor)"
  - "Branko — Product Engineering (primary pain-point owner / key user)"
  - "Hector Salazar — SRX Global IT (Development & Integration)"
---

## Objective

Rewrite the Engineer Change Note (ECN) process from the legacy Stargile system into SM-Portal. The goal is to eliminate the pain Branko and the product engineering team experience with the current ECN workflow, and to automate the MOVEX component creation step that currently requires manual entry.

## Pain Points Being Solved

1. **Stargile ECN UX** is painful for product engineers — explicitly cited by Branko.
2. **Manual MOVEX component addition** — after raising an ECN in Stargile, engineers must manually add the new component in MOVEX. The rewrite will automate this via MOVEX MI API.

## Scope — Stage 1

- ECN creation and submission form in SM-Portal
- MOVEX API integration for automated component/item creation in MOVEX when an ECN is approved
- Specific MI program for component creation: **not yet identified** (open item — see ADR-017)

## Data Flow (planned)

```
SM-Portal ECN Form
    ↓ on approval
MOVEX MI API (component/item creation — MI program TBC)
    ↓
MOVEX / M3 ERP
```

## Current Status

- [x] Priority confirmed: next after MyInvois (ADR-017, 2026-02-12)
- [ ] Stage 1 feature scope to be defined with Branko and product engineering
- [ ] Identify MOVEX MI program for component creation
- [ ] UI/UX design for ECN form in SM-Portal
- [ ] Development (not started — blocked on MyInvois go-live)

## Notes

- Legacy system: **Stargile** (ECN functionality being migrated out of it)
- Portal: **SM-Portal** is the target host
- This project is currently in planning/pre-development. Development does not start until MyInvois Phase 1 ships.
