---
kpi: "Cost Savings YTD — Currency Neutral"
category: financial
consumer:
  - "SRX Finance (Tony Piper)"
  - "Scanfil Global Supply Chain (Lars / Heikki)"
data_source: MOVEX
reporting_layer: "Power BI via Microsoft Fabric"
refresh_cadence: monthly
owner: "SRX Finance / Scanfil Supply Chain (joint)"
status: definition-pending
last_reviewed: 2026-02-26
related_decisions:
  - ADR-014
  - ADR-015
related_projects:
  - sourcing-kpis-scanfil
---

## Definition

Year-to-date purchasing cost savings, expressed in currency-neutral terms to eliminate foreign exchange distortion.

Sub-components (from Bryan's input in 2026-02-26 meeting):
- **Data Binding / Invoice Savings**: Savings derived from invoice-level data. Jan–Jun baseline approximately 15–20%.
- **Cost Savings YTD**: Cumulative savings against prior-year or standard cost baseline.
- **Price Development Savings**: Trend in price changes over time for purchased materials (Scanfil-specific framing).

Currency neutralization must be applied in the Microsoft Fabric transformation layer before reporting (per ADR-014 and open risk `movex-data-quality-outliers-distort-kpi-calculations.md`).

## Ownership Dimensions

- Global Purchasing
- Local Purchasing
- Customer (managed by field)

## Data Sourcing Status

- Source system: MOVEX/M3 ERP (invoice and purchase order data)
- Specific MI programs and MOVEX table fields: **not yet mapped**
- Bryan (org TBC) confirmed underlying data is available in MOVEX
- Currency neutralization logic: **not yet designed** (open item)

## Notes

- This KPI aligns requirements from two stakeholder groups (SRX Finance via Tony Piper; Scanfil Supply Chain via Lars/Heikki) — single pipeline should serve both.
- Outlier elimination is required before this metric is reliable (see risk note).
- Finance framing: "Average Cost / Saving KPIs focused on Price Development Savings."
