---
id: ADR-015
decision: "Sourcing KPI data extraction and refresh exercise runs on a monthly cadence"
status: decided
date: 2026-02-26
reversibility: type-2-reversible
review_date: 2026-04-26
assumptions:
  - "Monthly granularity is sufficient for Price Development Savings and Cost Savings YTD KPIs"
  - "MOVEX data for the full month is stable and complete by the time the monthly extraction runs"
  - "Scanfil and SRX Finance stakeholders accept monthly refresh latency — no real-time or weekly requirement"
alternatives:
  - "Weekly cadence — discussed implicitly but not adopted; monthly was confirmed as the agreed frequency"
  - "Real-time / event-driven pipeline — rejected at this stage; complexity not justified for savings and cost tracking KPIs"
dependents:
  - ADR-014
projects:
  - sourcing-kpis-scanfil
---

## Context

The 2026-02-26 sourcing KPIs meeting concluded with an explicit agreement: "Do this exercise MONTHLY." This governs the refresh cadence for all Scanfil KPI data sourced from MOVEX via Microsoft Fabric.

## Decision

The KPI data sourcing pipeline (MOVEX → Fabric → Power BI) refreshes on a monthly cadence. This applies to:
- Price Development Savings (currency neutral)
- Cost Savings YTD
- Invoice-based savings (Jan–Jun baseline: ~15–20%)
- OTD and CPPM operational KPIs

## Implications

- Pipeline scheduling must be configured in Microsoft Fabric for monthly execution.
- Stakeholder reports in Power BI will reflect the prior month's MOVEX data.
- If intra-month visibility is requested in future, this decision should be revisited.
