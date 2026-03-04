---
project: "Sourcing KPIs — Scanfil Data Integration"
status: planning
phase: "Data sourcing design — MOVEX fields identification"
go_live: null
owner: "Hector Salazar (SRX Global IT)"
key_decisions:
  - ADR-014
  - ADR-015
open_risks:
  - movex-data-quality-outliers-distort-kpi-calculations
stakeholders:
  - "Lars — Scanfil Global Supply Chain (KPI developer)"
  - "Heikki — Scanfil Global Supply Chain (Development Mgmt / Operational KPIs)"
  - "Karen — SRX Global IT (Business Applications)"
  - "Hector Salazar — SRX Global IT (Development & Integration)"
  - "Tony Piper — SRX Finance (aligned requirement: Average Cost / Savings KPIs)"
  - "Bryan — (referenced; confirmed MOVEX data availability; role/org TBC)"
---

## Objective

Extract KPI data from MOVEX/M3 ERP and surface it in Power BI via Microsoft Fabric for Scanfil Global Supply Chain and SRX Finance stakeholders.

This project aligns two parallel KPI requirements:
1. **Scanfil Supply Chain** (Lars / Heikki): Operational KPIs — OTD, CPPM, Price Development Savings
2. **SRX Finance** (Tony Piper): Average Cost KPIs, Cost Savings YTD (currency neutral)

## Data Flow

```
MOVEX (M3 ERP / DB2-AS400) → Microsoft Fabric → Power BI
```

Refresh cadence: **monthly** (per ADR-015)

## KPIs in Scope

| KPI | Consumer | Notes |
|-----|----------|-------|
| OTD (On-Time Delivery) | Scanfil Supply Chain | Operational |
| CPPM | Scanfil Supply Chain | Operational; abbreviation to be confirmed |
| Price Development Savings | Scanfil Supply Chain | Currency neutral |
| Cost Savings YTD | SRX Finance / Scanfil | Currency neutral; baseline Jan–Jun ~15–20% |
| Average Cost | SRX Finance | Tony Piper requirement |

## KPI Ownership Dimensions

- **Global** Purchasing
- **Local** Purchasing
- **Customer** (managed by field)

## Current Status

- [x] Stakeholder alignment meeting held (2026-02-26)
- [x] Architecture decided: MOVEX → Fabric → Power BI (ADR-014)
- [x] Cadence decided: monthly (ADR-015)
- [ ] MOVEX field mapping for each KPI — not yet done
- [ ] Fabric pipeline design
- [ ] Power BI report design
- [ ] Data quality rules for outlier elimination
- [ ] Currency neutralization logic defined

## Notes

- Identical data sourcing approach serves both Scanfil supply chain savings tracking and SRX Finance cost reporting — minimize duplication.
- Bryan (stakeholder, org TBC) confirmed all required data exists in MOVEX.
- Data quality: outliers must be eliminated before surfacing in reports.
