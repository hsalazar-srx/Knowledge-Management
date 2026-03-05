---
risk: "Confirming customer order delivery dates takes more than 2 weeks, damaging customer satisfaction and OTD performance"
category: operational
likelihood: high
impact: moderate
status: active
reviewed: 2026-01-20
early_warnings:
  - "Customer complaints about slow order confirmation responses"
  - "Sales team or CBMs unable to confirm delivery dates within 5 business days"
  - "OTD 1st Confirmed Date KPI trending below target (once reporting is live)"
  - "MSP (material shortfall) planning is done manually — automated alerts not in place"
  - "Lead times in MOVEX are not current — sourcing has not updated them"
mitigations:
  - "Sourcing team to update Lead Times in MOVEX as a priority action"
  - "Bring Planner and Purchasing into a shared accountability process with clear WHO/WHAT/WHEN"
  - "Add purchasing Lead Time to MSP (Material Shortage Prevention) triggers — force PO creation when lead time is breached"
  - "Create automated purchasing rules based on inventory data to reduce manual decision-making delay"
  - "Identify key accountable members for OTD confirmation process"
contingency:
  - "If confirmation latency cannot be reduced to < 5 days: agree a formal SLA with customers and communicate proactively"
  - "Escalate to CBM (Customer Business Management) for customer-specific priority cases"
---

## Context

Highlighted as a critical pain point (marked ***** in meeting notes) in the 2026-01-20 Melbourne QSDC session. The group discussed that confirming a customer's order delivery date takes more than 2 weeks. The root causes discussed were:

- Lead times in MOVEX are not updated by sourcing (data quality issue)
- MSP (Material Shortage Prevention) process is manual rather than automated
- Accountability for WHO confirms WHAT by WHEN is unclear
- Planner and Purchasing are not working in a coordinated, visible process

The group set OTD 1st Confirmed Date as the official 2026 KPI (ADR-021), making this latency problem directly measurable once reporting is live.

## Related

- Decision ADR-021: Customer OTD 1st Confirmed Date is official 2026 KPI
- Project: sourcing-kpis-scanfil
