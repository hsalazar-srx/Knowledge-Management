---
id: ADR-019
decision: "MOVEX order type 100 must not be used for customer orders; MAT and MTO are the approved company-wide order types"
status: decided
date: 2026-02-11
reversibility: type-2-reversible
review_date: 2026-05-11
assumptions:
  - "MAT (Make-to-Stock) and MTO (Make-to-Order) are correctly configured and active for all divisions in MOVEX"
  - "Order type definitions in MOVEX are company-wide — there are no division-specific order type configurations that would block GRB from using MAT or MTO"
  - "GRB division can migrate to MAT/MTO for new orders without requiring data migration of existing historical orders entered under type 100"
alternatives:
  - "Allow order type 100 for GRB as a division-specific variant — rejected because Max Wittmann confirmed order types are company-wide; division-specific treatment is not supported and creates confusion"
  - "Create a new GRB-specific order type — not discussed; not needed given MAT and MTO already exist"
dependents: []
projects: []
---

## Context

Bryan Fu (GRB factory) raised confusion in the 2026-02-11 order type update meeting: GRB had been using order type 100, but Hector Salazar had previously communicated that 100 is not allowed. Bryan was unsure what the correct order types should be.

Max Wittmann (MOVEX expert) confirmed:
1. Order types are **company-wide** — not division-specific. Melbourne's order types (MAT, MTO) are available to all divisions including GRB.
2. There is nothing preventing GRB from using MAT or MTO.
3. A SQL extract grouped by division and order type (since start of 2024) confirmed the mixed usage.

## Decision

- Order type **100** is not a valid customer order type and must not be used.
- **MAT** (Make-to-Stock) and **MTO** (Make-to-Order) are the approved order types for all divisions.
- GRB division should migrate to using MAT or MTO for new customer orders immediately.

## Implications

- Existing orders in GRB entered under type 100 require a data quality assessment — determine if they should be reclassified or if historical records are acceptable as-is.
- This decision formalises a policy that Hector had communicated verbally; it was never previously documented in the vault.
- The ORTP field on OHEDCO table holds the order type — see `m3-knowledge/tables/ohedco.md`.

## Notes

- Max offered to reconvene on order types or SQLs if needed.
- Order type definitions, meanings, and when to use MAT vs. MTO are not yet documented — a follow-up knowledge session is recommended.
