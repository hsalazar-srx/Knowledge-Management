---
risk: "MOVEX data quality issues and outliers distort Scanfil KPI calculations in Power BI"
category: operational
likelihood: medium
impact: moderate
status: active
reviewed: 2026-02-26
early_warnings:
  - "KPI values show unexplained spikes or drops month-over-month that cannot be explained by operational changes"
  - "Scanfil or Finance stakeholders flag numbers as implausible during report review"
  - "MOVEX source data contains duplicate purchase order lines or zero-value transactions"
  - "Currency conversion anomalies appear in the currency-neutral savings calculation"
mitigations:
  - "Define explicit outlier elimination rules (thresholds, criteria) before first pipeline run — agreed in 2026-02-26 meeting"
  - "Implement currency neutralization logic in Microsoft Fabric transformation layer (ADR-014)"
  - "Add data validation step in Fabric pipeline to flag records outside expected ranges before loading to Power BI"
  - "Monthly review of source-to-report reconciliation by Hector Salazar before releasing reports to stakeholders"
contingency:
  - "If outlier rules are not yet defined at go-live, suppress the affected KPI from the report and label it 'Data Quality Review Pending'"
  - "Retain raw MOVEX extract in Fabric alongside cleaned data so outlier investigation is possible post-publication"
decisions:
  - ADR-014
  - ADR-015
projects:
  - sourcing-kpis-scanfil
---

## Context

Raised during the 2026-02-26 sourcing KPIs meeting. The group acknowledged that MOVEX data will require outlier elimination and currency neutralization before KPI calculations are valid. The specific rules for what constitutes an outlier were not defined in this meeting — this is an open design item for the project.

## Signal Log

| Date | Signal | Source |
|------|--------|--------|
| 2026-02-26 | Team acknowledged need to "eliminate outliers" from MOVEX data; currency neutral requirement confirmed for Cost Savings KPI | Sourcing KPIs alignment meeting |
