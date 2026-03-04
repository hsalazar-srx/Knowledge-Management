---
kpi: "OTD — On-Time Delivery"
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

On-Time Delivery percentage: the proportion of purchase orders / deliveries fulfilled on or before the committed delivery date.

Standard DIFOT-adjacent metric. Also referenced in DIFOT reporting for SRX operations.

## Ownership Dimensions

- Global Purchasing
- Local Purchasing
- Customer (managed by field)

## Data Sourcing Status

- Source system: MOVEX/M3 ERP
- Specific MI programs and MOVEX table fields: **not yet mapped** (open item for Hector)
- Bryan (org TBC) confirmed underlying data is available in MOVEX

## Notes

- This KPI was identified alongside CPPM as an equal-priority operational KPI in the 2026-02-26 meeting.
- Aligns with DIFOT% tracked in `kpis/difot-percent.md` (if exists) — check for duplication before finalizing definition.
