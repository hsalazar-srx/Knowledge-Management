---
date: 2026-02-11
meeting: "Order Type Update"
participants:
  - Bryan Fu (GRB factory)
  - Max Wittmann (MOVEX expert)
  - Karen Lewin
  - Hector Salazar
transcript: "archive/transcripts/100226-order-type-update.md"
mined: 2026-03-05
---

## Summary

A working session covering three topics: MOVEX order type policy clarification, AR/AP ledger SQL patterns, and an M3 output management misconfiguration.

---

## Topic 1 — Order Type Policy (Bryan Fu / Max Wittmann)

Bryan Fu (GRB factory) raised confusion: GRB had been using order type 100 for customer orders, but Hector Salazar had previously communicated 100 is not allowed. Bryan was unsure what the correct order types should be.

Max Wittmann clarified:
- Order types are **company-wide** — not division-specific. Nothing prevents GRB from using MAT or MTO.
- A SQL extract grouped by division and order type (since start of 2024) confirmed GRB's mixed usage of type 100.
- GRB should switch to MAT or MTO immediately for new customer orders.

**Vault action:** ADR-019 already captures this decision (`decisions/order-type-100-must-not-be-used-mat-and-mto-are-approved-company-wide.md`).

---

## Topic 2 — AR/AP Ledger SQL Patterns (Karen Lewin / Max Wittmann)

Max explained the FSLEDGE (AR) and FPLEDGE (AP) ledger structure for SQL queries:

**FSLEDGE (AR):**
- Tran code 10 = invoice (always one per invoice)
- Tran code 20 = cash receipt / payment (can be multiple for partial payments)
- SQL pattern: group by customer number + invoice number + invoice year

**FPLEDGE (AP):**
- Tran code 40 = AP invoice
- Tran code 50 = AP payment
- Same grouping pattern as FSLEDGE

Karen confirmed this approach was a clearer way to query the ledgers than her previous approach.

**Vault actions:**
- FSLEDGE table already documented: `m3-knowledge/tables/fsledge-ar-sales-ledger.md`
- FPLEDGE table created: `m3-knowledge/tables/fpledge-ap-purchase-ledger.md`

---

## Topic 3 — Output Management Misconfiguration (Karen Lewin)

Karen found that a Johor Bahru (JB) warehouse user had incorrect email addresses configured in MNS205 (Output Management). The emails did not belong to the user — suspected bad setup during user creation. Delivery notes were routing to the wrong recipient or bouncing.

Karen will attempt to fix via MNS205 and escalate to Max if needed.

**Vault actions:**
- MNS205 program documented: `m3-knowledge/transactions/mns205-output-management.md`
- Risk created: `risks/m3-output-management-misconfiguration-routes-documents-to-wrong-recipients.md`

---

## Action Items

| Owner | Action |
|-------|--------|
| Bryan Fu | Switch GRB customer orders to MAT or MTO order types immediately; stop using order type 100 for new orders |
| Karen Lewin | Fix MNS205 email entries for JB warehouse user; escalate to Max Wittmann if not resolved |
| Max Wittmann | Available to reconvene on order types or SQL queries if needed |
| IT team | Add MNS205 validation to new user onboarding checklist (from risk mitigation) |

---

## Strategy Flags

None. No contradictions with documented strategy.

---

## Notes

- The meeting transcript has a gap between approximately 1:29 and 53:31 — the middle portion of the meeting was not captured in the transcript provided.
- "Hector" referred to in the meeting is Hector Salazar (IT).
