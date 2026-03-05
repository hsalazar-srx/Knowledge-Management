---
project: "DISP — Defence Industry Security Program Readiness"
status: planning
phase: "Internal ICT gap analysis"
go_live: null
owner: "Karen Lewin (SRX Global IT)"
key_decisions:
  - ADR-022
open_risks:
  - disp-ict-security-gaps-block-defence-contract-eligibility
stakeholders:
  - "Karen Lewin — SRX Global IT (gap analysis owner)"
  - "Devian — (DISP advisor / internal champion)"
  - "John Ferrieks — (executive sponsor; wants to enter defence market)"
  - "Marriat — Scanfil (ICT leverage contact)"
  - "DiStefano — Proposed external consultant (~$24K)"
  - "Jeta — Induction process owner"
  - "Mihai — MES / operational procedures"
---

## Objective

Achieve DISP (Defence Industry Security Program) certification to enable SRX to pursue defence sector contracts (e.g. Safran prospect). DISP is based on the ISO 27005 security framework and Australia's Essential Eight baseline controls.

SRX is also a newly public company — DISP certification aligns with increased governance expectations.

## DISP Framework Components

| Component | Status |
|-----------|--------|
| ISO 27005 (risk management) | Gap — not assessed |
| Essential Eight | Gap — not assessed |
| Physical security | Gap — not assessed |
| Internal training / awareness | Partial — Scanfil Dozier platform has some courses |
| Governance / ICT management | Gap — legacy cost-saving approach left gaps |
| Induction process | Manual — needs formalisation (Jeta) |

## Phase 1 — Internal Gap Analysis (current)

Karen Lewin to produce an ICT cost and gap analysis covering:
- Current ICT security posture vs DISP requirements
- Gap sizing and remediation cost estimates
- How Scanfil group ICT resources (via Marriat) can reduce the gap
- Decision whether to engage DiStefano consultant (~$24K) for submission support

Devian's recommendation: treat as initial research only. Focus on:
1. Essential Eight assessment
2. ISO 27005 review
3. Internal training inventory (Dozier)
4. Physical security review

## Open Questions

- Is Christian part of the DCN (approval body) for DISP-related documentation?
- What Scanfil group ICT tools/frameworks are available to leverage? (Marriat to advise)
- What is the ROI case for DISP certification?

## Scanfil Group Policy — Baseline for Gap Analysis (added 2026-03-05)

Scanfil's top-12 mandatory process announcement (2026-02-23) reveals that **three processes IT owns are mandatory for SRX as a new Scanfil site:**

| Scanfil Process | DISP Relevance | Action |
|----------------|---------------|--------|
| IT/IS Security Policy | Core control framework baseline | Obtain from SMS; use as starting point for Essential Eight and ISO 27005 gap assessment |
| Group Authorization Manual | Access control governance | Obtain from SMS; assess current SRX access management against it |
| Security Incident and Breach Handling Process | Incident response — mandatory for DISP | Obtain from SMS; adopt or extend for SRX |

**Critical implication:** Karen's gap analysis should cross-reference these Scanfil group policies **before** assessing gaps against DISP requirements. If the Scanfil group policy already satisfies some Essential Eight controls, the residual DISP gap is smaller than feared. This could significantly reduce the $24K consultant scope.

See compliance note: `compliance/scanfil-sms-top-12-processes-mandatory-for-srx-new-site.md`

## Open Questions

- Is Christian part of the DCN (approval body) for DISP-related documentation?
- What Scanfil group ICT tools/frameworks are available to leverage? (Marriat to advise)
- What is the ROI case for DISP certification?
- Do the Scanfil group IT/IS Security Policy and Security Incident Handling Process already satisfy any DISP/Essential Eight controls?

## Status History

- 2026-01-21: DISP raised in Melbourne visit session with Devian
- 2026-01-21: Karen assigned internal gap analysis (TODO captured)
- 2026-01-21: Zafran identified SRX as a good fit for DISP
- 2026-02-23: Scanfil published top-12 mandatory processes — IT/IS Security Policy, Group Authorization Manual, and Security Incident Handling are now mandatory baselines that inform the gap analysis
