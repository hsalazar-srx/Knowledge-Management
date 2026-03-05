---
risk: "Significant ICT security gaps prevent SRX from achieving DISP certification and being eligible for defence sector contracts"
category: compliance
likelihood: high
impact: critical
status: active
reviewed: 2026-01-21
early_warnings:
  - "Karen's internal gap analysis returns a large number of uncovered controls"
  - "Essential Eight maturity assessment comes in at ML0 or ML1 for key controls"
  - "Physical security audit reveals gaps not previously documented"
  - "Dozier training platform shows low completion rates for security awareness courses"
  - "Induction process (Jeta) cannot demonstrate consistent security onboarding"
  - "No documented information security management system (ISMS)"
mitigations:
  - "Complete Karen's internal ICT cost and gap analysis (ADR-022 — in progress)"
  - "Leverage Scanfil group ICT resources via Marriat to reduce remediation scope and cost"
  - "Enrol staff in existing Dozier security training courses immediately while new courses are developed"
  - "Assess whether $24K DiStefano consultant engagement is justified after gap analysis is complete"
  - "Map SRX ICT controls against Essential Eight and ISO 27005 to identify critical-path items"
contingency:
  - "If DISP certification is not achievable within target timeline: negotiate with defence prospects on alternative security assurance approaches"
  - "If gaps are too large for internal remediation: scope a multi-year ICT security uplift program funded by DISP business case ROI"
---

## Context

Raised in the 2026-01-21 Melbourne DISP/Devian session. SRX has significant ICT security gaps described as a legacy of the previous cost-saving-centric management approach. DISP (Defence Industry Security Program) is an Australian government framework based on ISO 27005 and the Essential Eight.

DISP certification is required for SRX to pursue:
- **Safran** (defence sector prospect)
- Other defence contracts identified by John Ferrieks

SRX has recently become a **Public Company**, which adds governance pressure independent of DISP.

The proposed external consultant (DiStefano, ~$24K) would provide gap analysis support and guide the DISP submission — however, decision was made to do internal analysis first (ADR-022) to properly size the engagement.

## Related

- Decision ADR-022: Internal gap analysis precedes external consultant engagement
- Project: disp-defence-readiness
