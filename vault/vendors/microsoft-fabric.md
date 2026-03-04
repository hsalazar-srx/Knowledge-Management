---
entity: "Microsoft Fabric"
category: cloud
monitoring_priority: medium
last_reviewed: 2026-02-26
monitoring_cadence_days: 30
related_decisions:
  - ADR-014
related_projects:
  - sourcing-kpis-scanfil
---

## Profile

Microsoft Fabric is Microsoft's unified analytics platform (SaaS), combining data integration, data engineering, data warehousing, and Power BI into a single platform. SRX Manufacturing is using or evaluating Fabric as the data pipeline and transformation layer between MOVEX/M3 ERP and Power BI dashboards.

## SRX Usage

- **Role**: Data integration and transformation layer for Scanfil KPI reporting (MOVEX → Fabric → Power BI)
- **Use case confirmed**: Monthly KPI data extraction — OTD, CPPM, Cost Savings YTD, Price Development Savings
- **Decision**: ADR-014 selected Fabric as the preferred data integration layer

## Signal Log

| Date | Signal | Source | Assessed Impact |
|------|--------|--------|----------------|
| 2026-02-26 | Fabric confirmed as the agreed data pipeline for Scanfil KPI sourcing project. "Fabric to fetch data" — explicit agreement in stakeholder alignment meeting. | Sourcing KPIs alignment meeting (Lars, Heikki, Karen, Hector) | High — architectural commitment made |

## Open Questions

- Licensing: confirm SRX has or will obtain Fabric capacity (F-SKU or embedded with Power BI Premium).
- Connectivity to MOVEX/DB2-AS400: confirm Fabric gateway or connector availability for on-premise or cloud-hosted M3.
- Existing Fabric workspaces: determine if a workspace exists for SRX data or if a new one is required.
