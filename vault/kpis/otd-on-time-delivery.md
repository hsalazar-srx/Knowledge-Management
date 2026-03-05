---
kpi: "OTD — On-Time Delivery (Customer, 1st Confirmed Date)"
category: operational
consumer:
  - "Scanfil Global Supply Chain (Lars / Heikki)"
data_source: MOVEX
reporting_layer: "Power BI via Microsoft Fabric"
refresh_cadence: monthly
owner: "Scanfil Global Supply Chain"
status: definition-confirmed
last_reviewed: 2026-01-20
related_decisions:
  - ADR-014
  - ADR-015
  - ADR-021
related_projects:
  - sourcing-kpis-scanfil
---

## Definition

**Customer OTD 1st Confirmed Date** — the proportion of customer orders where the actual ship/departure date is on or before the 1st Confirmed Date committed to the customer. This is the **official Scanfil KPI for 2026** (ADR-021, established 2026-01-20 Melbourne QSDC session).

The 1st Confirmed Date **cannot be changed** once set. The 2nd Confirmed Date can be adjusted; OTD is always measured against the 1st.

Standard DIFOT-adjacent metric. Also referenced in DIFOT reporting for SRX operations.

## Date Types Tracked in MOVEX (per Customer Order)

| Date Type | Description | Role in OTD |
|-----------|-------------|-------------|
| Planned | Internal production schedule | — |
| Requested | Customer's requested delivery date | — |
| Confirmed (1st) | Date first committed to the customer | **KPI measurement point — immutable** |
| Confirmed (2nd) | Adjusted date if conditions change | Not used for KPI |
| Departure / Real Ship | Actual ship date | Numerator input |
| Target | Internal target date | Operational planning |

## Ownership Dimensions

- Global Purchasing
- Local Purchasing
- Customer (managed by field)

## Data Sourcing Status

- Source system: MOVEX/M3 ERP
- Specific MI programs and MOVEX table fields: **not yet mapped** (open item for Hector)
- Bryan (org TBC) confirmed underlying data is available in MOVEX
- Live OTD dashboard visible at: `app.powerbi.com` → Factory KPIs

## Known Factors Affecting OTD

- **Product shortages** — directly impact OTD if material is unavailable when order is due
- **Lead time data quality** — Sourcing has not kept MOVEX lead times current; stale LTs undermine planning
- **Confirmation latency** — setting the 1st Confirmed Date currently takes >2 weeks (see risk: `customer-order-delivery-confirmation-latency-exceeds-two-weeks.md`)
- **Rework** — stopping a production line is costly; rework events cascade into OTD misses

## Improvement Priority Order (2026-01-20)

1. Inventory Accuracy — fix first
2. Purchasing handling rules — MSP lead times, automated PO triggers
3. CBM (Customer Business Management) involvement — accountability and escalation

## Notes

- This KPI was confirmed as the official 2026 Scanfil metric at the 2026-01-20 Melbourne QSDC session.
- Also identified alongside CPPM as an equal-priority operational KPI in the 2026-02-26 Scanfil Supply Chain alignment meeting.
- Aligns with DIFOT% tracked in `kpis/difot-percent.md` (if exists) — check for duplication before finalizing definition.
- After April 2026, Customer Quotation is the next QSDC roadmap item after OTD stabilises.
