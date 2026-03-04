---
kpi: "CPPM — Operational KPI (full name to be confirmed)"
category: operational
consumer:
  - "Scanfil Global Supply Chain (Lars / Heikki)"
data_source: MOVEX
reporting_layer: "Power BI via Microsoft Fabric"
refresh_cadence: monthly
owner: "Scanfil Global Supply Chain"
status: definition-pending
last_reviewed: 2026-02-26
related_decisions:
  - ADR-014
  - ADR-015
related_projects:
  - sourcing-kpis-scanfil
---

## Definition

**CPPM abbreviation not confirmed** as of 2026-02-26 meeting. Documented as stated. Possible expansions in manufacturing/supply chain context:
- Cost Per Purchase per Manufacturer
- Corrective actions / Complaints Per Million

**Action required:** Confirm full name and definition with Lars or Heikki (Scanfil) before pipeline design.

## Ownership Dimensions

- Global Purchasing
- Local Purchasing
- Customer (managed by field)

## Data Sourcing Status

- Source system: MOVEX/M3 ERP
- Specific MI programs and MOVEX table fields: **not yet mapped**
- Bryan (org TBC) confirmed underlying data is available in MOVEX

## Notes

- Identified alongside OTD as an equal-priority operational KPI in the 2026-02-26 meeting: "OTD CPPM — Same importance."
- Definition must be confirmed before MOVEX field mapping work begins.
