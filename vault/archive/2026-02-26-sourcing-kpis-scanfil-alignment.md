---
type: meeting-summary
date: 2026-02-26
topic: "Sourcing KPIs — Scanfil Data Integration Alignment"
attendees:
  - "Lars — Scanfil Global Supply Chain (KPI developer, multiple reports)"
  - "Heikki — Scanfil Global Supply Chain (Development Management / Operational KPIs)"
  - "Karen — SRX Global IT (Business Applications)"
  - "Hector Salazar — SRX Global IT (Development & Integration Engineer)"
raw_transcript: "archive/transcripts/260226-sourcing-kpis.md"
extracted_to:
  decisions:
    - decisions/microsoft-fabric-chosen-as-data-integration-layer-for-kpi-reporting.md
    - decisions/sourcing-kpi-data-exercise-runs-on-monthly-cadence.md
  projects:
    - projects/sourcing-kpis-scanfil.md
  risks:
    - risks/movex-data-quality-outliers-distort-kpi-calculations.md
  kpis:
    - kpis/otd-on-time-delivery.md
    - kpis/cppm-operational-kpi.md
    - kpis/cost-savings-ytd-currency-neutral.md
  vendors:
    - vendors/microsoft-fabric.md
---

## Summary

Stakeholder alignment meeting to define the data sourcing approach for Scanfil KPI reporting requirements. SRX IT (Hector, Karen) met with Scanfil Global Supply Chain (Lars, Heikki) to agree on architecture, KPIs in scope, and delivery cadence.

## Key Outcomes

### Architecture Agreed
MOVEX → Microsoft Fabric → Power BI (ADR-014). Fabric fetches data from M3 ERP, applies transformations, and surfaces KPIs in Power BI.

### Cadence Agreed
Monthly refresh (ADR-015). Explicit close: "Do this exercise MONTHLY."

### KPIs in Scope
Two equal-priority streams confirmed:

**Operational KPIs (Scanfil Supply Chain — Lars/Heikki):**
- OTD (On-Time Delivery)
- CPPM (abbreviation; full name not confirmed — action item)
- Price Development Savings (currency neutral)

**Finance KPIs (aligned with Tony Piper / SRX Finance):**
- Average Cost
- Cost Savings YTD (currency neutral)
- Invoice-based savings (Jan–Jun baseline ~15–20%)

### Ownership Dimensions
All KPIs tracked across: Global Purchasing, Local Purchasing, Customer (field-managed).

### Data Availability
Bryan (stakeholder, org not confirmed in meeting) was referenced as having confirmed all required KPI data is available in MOVEX. This aligns both Scanfil supply chain and SRX Finance requirements with a single data source.

### Data Quality Requirements
- Outlier elimination required before KPI calculations
- Currency neutralization required for savings KPIs
- Specific rules not yet defined — open design item

## Open Items / Action Items

| Owner | Action |
|-------|--------|
| Hector Salazar | Map MOVEX MI programs and fields for each KPI (OTD, CPPM, Cost Savings, Price Dev) |
| Lars / Heikki | Confirm full name and definition of CPPM |
| Hector Salazar | Design outlier elimination rules for Fabric transformation layer |
| Hector Salazar | Design currency neutralization logic for savings KPIs |
| Karen | Confirm Microsoft Fabric licensing status for SRX |
| TBC | Clarify Bryan's role/org and confirm MOVEX data availability details |
| Hector Salazar | Confirm Fabric connectivity to MOVEX / DB2-AS400 |

## Strategy Notes

- This project creates an opportunity to serve both Scanfil supply chain savings tracking and SRX Finance cost reporting with a single pipeline — dual-stakeholder alignment is a strength but introduces coordination overhead.
- No contradiction with existing strategy detected. DIFOT / OTD KPIs mentioned here should be cross-referenced with any existing DIFOT project to avoid dual-tracking the same metric.
