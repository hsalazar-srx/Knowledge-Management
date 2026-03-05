---
id: ADR-024
decision: "SRX Global sites are classified as new Scanfil sites and must implement the top 12 mandatory Scanfil processes at the first phase of integration"
status: decided
date: 2026-02-23
reversibility: type-1-irreversible
review_date: 2026-05-23
assumptions:
  - "Scanfil's classification of SRX Global (JB, Melbourne, Detroit, Cortona) as 'new sites' is confirmed and applies in full"
  - "The top 12 processes released in SMS (Scanfil Management System) by 26 February 2026 are the authoritative versions SRX must adopt"
  - "SRX IT is responsible for implementing at minimum the IT/IS Security Policy, Group Authorization Manual, and Security Incident and Breach Handling Process from the top 12 list"
  - "In-depth process training for SRXGlobal sites will be run by Scanfil in spring 2026 — SRX IT must be ready to participate and cascade"
  - "The remaining 26 processes will be released by H1 2026, creating a second wave of compliance obligations"
alternatives:
  - "Treat SRX processes as locally managed and selectively adopt Scanfil processes — not available; Scanfil has mandated adoption for all new sites as part of integration"
  - "Delay adoption until formal integration project is launched — not available; top 12 are required 'at the first phase of integration', which SRX is already in"
dependents:
  - ADR-022
projects:
  - disp-defence-readiness
---

## Context

Published by Scanfil as an intranet announcement on **2026-02-23**. Scanfil has entered a strategic growth phase and has completed a framework of 38 mandatory business processes to standardise operations across all sites.

SRX Global sites — **Johor Bahru, Melbourne, Detroit, Cortona** (plus 3 other MB sites) — are explicitly classified as **new sites** (part of Scanfil as of 2024). This classification carries binding obligations.

## The Top 12 Mandatory Processes (released in SMS by 2026-02-26)

| # | Process | IT Relevance |
|---|---------|-------------|
| 1 | Code of Conduct | Low — HR-led |
| 2 | Supplier Code of Conduct | Low — Procurement-led |
| 3 | **IT/IS Security Policy** | **HIGH — IT must own and implement** |
| 4 | **Group Authorization Manual** | **HIGH — IT access management** |
| 5 | Finance Manual | Low — Finance-led |
| 6 | Transfer Pricing Policy | Low — Finance-led |
| 7 | R12 Month Forecasting | Medium — IT data systems support |
| 8 | **Security Incident and Breach Handling Process** | **HIGH — IT must own and implement** |
| 9 | Accidents and Incidents Handling | Low — HSE-led |
| 10 | Disclosure and Communications Policy | Medium — relevant as SRX is now public company |
| 11 | Customer Agreement Policy | Low — Commercial-led |
| 12 | Treasury Policy | Low — Finance-led |

**IT directly owns 3 of the top 12: IT/IS Security Policy, Group Authorization Manual, Security Incident and Breach Handling Process.**

## Remaining 26 Processes

To be released in SMS by **H1 2026**. New sites must implement them according to site-specific business plans led by the integration manager. Watch for IT-relevant processes in the second wave.

## Cascade Responsibility

- Managing Directors are responsible for cascading processes to their plants.
- Scanfil will initiate in-depth process trainings with SRXGlobal sites in **spring 2026**.
- Old sites follow quality and performance council process and functional meetings.

## Relationship to DISP

The Scanfil group IT/IS Security Policy and Security Incident & Breach Handling Process are mandatory starting points for the DISP gap analysis (ADR-022). Karen's internal analysis should explicitly cross-reference these Scanfil group policies as the baseline, rather than starting from scratch.

## Implication for Certification

SRX's existing certifications (ISO, etc.) are **not affected** — Scanfil has confirmed old-site certifications are preserved. New sites may optionally join group certification processes where appropriate.
