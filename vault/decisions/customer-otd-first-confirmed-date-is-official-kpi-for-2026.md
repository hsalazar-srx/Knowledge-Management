---
id: ADR-021
decision: "Customer OTD measured against the 1st Confirmed Date is the official Scanfil KPI for 2026; the 1st Confirmed Date cannot be changed once set"
status: decided
date: 2026-01-20
reversibility: type-2-reversible
review_date: 2026-03-22
assumptions:
  - "All five date types (Planned, Requested, Confirmed, Departure/Real Ship, Target) are captured in MOVEX for every customer order"
  - "The 1st Confirmed Date field in MOVEX reliably records the first date committed to the customer"
  - "Scanfil's global KPI framework allows SRX to report Customer OTD 1st Confirmed as the official metric"
  - "Product shortages and rework events will be captured as OTD impact factors, not as exclusions"
alternatives:
  - "Measure OTD against Requested Date — not adopted; Requested Date is customer-driven and does not reflect operational commitment"
  - "Measure OTD against 2nd Confirmed Date — not adopted; 2nd Confirmed can be adjusted, making it less meaningful as a performance measure"
  - "Use DIFOT (Delivery In Full On Time) as the primary metric — not adopted for 2026; OTD 1st Confirmed chosen as simpler and aligned with Scanfil global"
dependents: []
projects:
  - sourcing-kpis-scanfil
---

## Context

Established in the 2026-01-20 Melbourne visit QSDC (Quality Satisfaction Delivery Cost) session attended by Bryan, Mihai, Manal, and Karen. The group aligned on Customer OTD as a key 2026 strategic KPI within Scanfil's QSDC framework.

The five date types tracked in MOVEX for each customer order are:
1. **Planned** — internal production schedule
2. **Requested** — customer's requested date
3. **Confirmed** — date committed to the customer (the KPI measurement point)
4. **Departure / Real Ship** — actual ship date
5. **Target** — internal target date

The critical rule: **the 1st Confirmed Date cannot be changed**. The 2nd Confirmed Date can be adjusted as conditions change. OTD is measured at the 1st Confirmed Date.

## Implications

- OTD data is sourced from MOVEX — the Confirmed Date field must be mapped precisely in the Sourcing KPIs project.
- Product shortages and rework events directly affect OTD and must be tracked as causal factors.
- Confirmed order delivery date takes more than 2 weeks to establish (surfaced as a pain point) — this latency itself affects OTD performance and is a separate improvement target.
- The Power BI OTD dashboard at `app.powerbi.com/Factory KPIs` surfaces this metric for factories.
- After April 2026, Customer Quotation work is next in the QSDC roadmap.

## Priorities Identified (2026-01-20)

In order of priority for achieving OTD improvement:
1. **Inventory Accuracy** — unreliable inventory data undermines OTD prediction
2. **Purchasing handling rules** — MSP lead times, automated purchasing rules based on inventory
3. **CBM (Customer Business Management) involvement** — accountability and escalation path

## Notes

- QSDC = Quality, Satisfaction, Delivery, Cost — Scanfil's strategic framework
- SCI = Scanfil Continuous Improvement (includes Lean / Six Sigma)
- EMS not elaborated in transcript — likely Enterprise Management System or similar
