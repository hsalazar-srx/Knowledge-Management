---
topic: "Scanfil mandatory top-12 business processes — SRX obligation as a new site in the Scanfil group"
category: internal
effective_date: 2026-02-26
last_reviewed: 2026-03-05
affected_decisions:
  - decisions/srx-must-implement-scanfil-top-12-processes-at-integration-phase-as-new-site.md
  - decisions/disp-internal-gap-analysis-precedes-external-consultant-engagement.md
---

## Overview

Scanfil has identified **38 business processes** to be standardised across all sites. The top **12 most critical** were simplified and released in the Scanfil Management System (SMS) by **2026-02-26**.

SRX Global sites (JB, Melbourne, Detroit, Cortona) are classified as **new Scanfil sites** and must implement all 12 at the first phase of integration. The remaining **26 processes** are to be released by **H1 2026**.

Source: Scanfil intranet announcement, published **2026-02-23**.

---

## IT-Owned Processes (3 of top 12)

These three processes fall within IT's ownership at SRX. All three are mandatory.

### 1. IT/IS Security Policy

**Status at SRX:** Gap — not yet aligned to Scanfil group policy.

The Scanfil group IT/IS Security Policy is a mandatory baseline. Karen Lewin's DISP gap analysis (ADR-022) should explicitly cross-reference this policy as the starting point — rather than deriving IT security requirements from scratch. Obtain the current version from SMS.

**DISP relevance:** ISO 27005 and Essential Eight requirements for DISP must be assessed against this Scanfil policy baseline. If the Scanfil group policy already meets some Essential Eight controls, the DISP gap reduces.

### 2. Group Authorization Manual

**Status at SRX:** Gap — current access management practices not assessed against Scanfil group standard.

Governs how user access and authorization is managed across Scanfil. Directly relevant to:
- New domain setup (ADR-018) — new domain provisioning must align with group authorization rules
- MNS205 output management misconfiguration (known risk) — a group authorization standard would prevent incorrect user setup
- DISP governance and ICT access control requirements

### 3. Security Incident and Breach Handling Process

**Status at SRX:** Gap — no documented incident response process currently in the vault.

Mandatory for DISP certification. Scanfil's group process provides a framework SRX can adopt (or extend) rather than authoring from scratch.

---

## Other Top-12 Processes with IT Touch Points

| Process | IT Touch Point |
|---------|---------------|
| Disclosure and Communications Policy | SRX is now a public company; IT systems handling investor/stakeholder communications must comply |
| R12 Month Forecasting | IT data systems (MOVEX, Power BI) must support the R12 forecasting data requirements |
| Code of Conduct | IT acceptable use policies should reference the group Code of Conduct |

---

## Timeline

| Milestone | Date | Status |
|-----------|------|--------|
| Top 12 released in SMS | 2026-02-26 | Should be available now |
| In-depth SRXGlobal process trainings (Scanfil-led) | Spring 2026 | Upcoming |
| Remaining 26 processes released in SMS | H1 2026 | Pending |
| SRX implementation of remaining 26 | Per site business plan | Not yet started |

---

## Required Actions for IT

1. **Obtain** Scanfil group IT/IS Security Policy from SMS — baseline for DISP gap analysis
2. **Obtain** Scanfil Group Authorization Manual from SMS — assess against current SRX access management
3. **Obtain** Scanfil Security Incident and Breach Handling Process from SMS — integrate into DISP readiness
4. **Prepare** for spring 2026 Scanfil-led process training for SRXGlobal sites
5. **Monitor** SMS for release of remaining 26 processes — watch for additional IT-relevant items

---

## Relationship to Existing Risks and Decisions

- Risk mitigated (partial): `scanfil-merger-integration-proceeds-without-clear-plan-causing-operational-chaos` — the existence of a formal 38-process framework confirms a structured integration approach exists, partially reducing the "no planning" signal from Nick (2026-01-21)
- Risk reinforced: `disp-ict-security-gaps-block-defence-contract-eligibility` — the mandatory IT/IS Security Policy and Security Incident Handling gaps add urgency to the DISP gap analysis
- Risk reinforced: `m3-output-management-misconfiguration-routes-documents-to-wrong-recipients` — the Group Authorization Manual would, if followed, prevent MNS205 misconfiguration at user setup time
