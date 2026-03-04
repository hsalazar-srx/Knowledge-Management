---
id: ADR-014
decision: "Microsoft Fabric is chosen as the data integration layer between MOVEX and Power BI for Scanfil KPI reporting"
status: decided
date: 2026-02-26
reversibility: type-2-reversible
review_date: 2026-04-26
assumptions:
  - "All required KPI source data is accessible from MOVEX/M3 ERP"
  - "Microsoft Fabric has sufficient connectivity to DB2/AS400 or M3 MI programs to pull MOVEX data"
  - "Power BI is the agreed visualization layer for both Scanfil Supply Chain and SRX Finance consumers"
  - "SRX already has or will obtain appropriate Microsoft Fabric licensing"
alternatives:
  - "Direct DB2/AS400 query to Power BI — rejected because Fabric provides a governed, reusable data lake layer rather than point-to-point connections"
  - "M3 MI program-based extraction to flat files — rejected because Fabric pipeline approach is more scalable for monthly refresh cadence"
dependents:
  - ADR-013
projects:
  - sourcing-kpis-scanfil
---

## Context

In the 2026-02-26 sourcing KPIs alignment meeting with Lars and Heikki (Scanfil Global Supply Chain) and Karen and Hector (SRX Global IT), the data flow architecture for Scanfil KPI reporting was agreed as:

**MOVEX → Microsoft Fabric → Power BI**

This aligns with an existing SRX data warehousing pattern (SRX Data → Datawarehouse Scanfil) and extends it to the KPI reporting use case.

## Decision

Microsoft Fabric is the integration and transformation layer. It fetches data from MOVEX on a monthly cadence, applies required transformations (currency neutralization, outlier elimination), and surfaces the data in Power BI for both:
- Scanfil Supply Chain KPIs (Lars / Heikki): OTD, CPPM, Price Development Savings
- SRX Finance KPIs (Tony Piper): Average Cost, Cost Savings YTD

## Notes

- Bryan (not in meeting, referenced indirectly) confirmed all required data is available in MOVEX to support Heikki's KPI requirements.
- Data quality work (outlier elimination, currency neutralization) must occur within the Fabric layer before surfacing in Power BI.
