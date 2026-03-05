---
date: 2026-01-20
date_end: 2026-01-21
meeting: "Melbourne Visit — QSDC, OTD, PLM, Scanfil Merger, DISP"
participants:
  - Bryan Fu (GRB factory)
  - Mihai (MES / operations)
  - Manal (attendee)
  - Karen Lewin (SRX Global IT)
  - Nick (attendee, day 1 wrap-up)
  - Nick Nicholson (Scanfil merger discussion)
  - Branko (Product Engineering / PLM)
  - NickN (PLM development)
  - Devian (DISP advisor)
  - Zafran (mentioned — DISP fit assessment)
transcript: "archive/transcripts/210126-visit-melbourne.md"
mined: 2026-03-05
---

## Overview

Two-day Melbourne visit with multiple working sessions across QSDC/OTD, Scanfil merger, MES/stock management, PLM/Stargile/BOM, and DISP (Defence Industry Security Program).

---

## Session 1 — 20/01/2026: QSDC / OTD / KPI Priorities (Bryan, Mihai, Manal, Karen)

The group aligned on OTD as the primary 2026 Scanfil KPI within the QSDC (Quality, Satisfaction, Delivery, Cost) framework.

**Key outcome:** Customer OTD 1st Confirmed Date is the official KPI for 2026. The 1st Confirmed Date cannot be changed once set; the 2nd Confirmed Date can be adjusted. *(ADR-021)*

**Date types tracked in MOVEX:** Planned, Requested, Confirmed (1st & 2nd), Departure/Real Ship, Target.

**Pain points raised:**
- Confirming customer delivery dates takes >2 weeks (critical pain point — ****)
- Sourcing has not updated Lead Times in MOVEX (MSP process manual)
- No automated purchasing rules; planning is done manually
- Need for accountability tracking in MOVEX: who did what and when (lower priority)

**Priorities for OTD improvement (in order):**
1. Inventory Accuracy
2. Purchasing handling / automated rules
3. CBM (Customer Business Management) involvement

**Roadmap:** After April 2026, Customer Quotation work begins.

Nick mentioned BOM template upload into Stargile and restarting PLM++.

---

## Session 2 — 21/01/2026: Scanfil Merger/Takeover (Nick Nicholson, Karen)

Nick raised serious concerns about the Scanfil takeover integration:
- "Might be chaos" — no visible planning
- "I don't see the planning"
- No investment for new factories — if not investing $1M/year, "caput in 2 years"
- Something changed rapidly within 2 weeks preceding the meeting
- Production line must be the highest priority through any integration
- Zafran identified SRX as a good fit for DISP

---

## Session 3 — 21/01/2026: SMS / MES (no named attendees)

- MES database must be cleaned first — reel data is not accurate
- **MOVEX is to be the single source of truth for all stock balances** *(ADR-020)*
- Xray machine currently sends data to Sandra who manually enters it into MOVEX — must be automated (TODO)

---

## Session 4 — 21/01/2026: Stargile / BOM Comparison / PLM (Branko, NickN)

Detailed PLM working session. Core finding: PLM is underused due to UX issues and trust gaps. *(ADR-023)*

**BOM problems identified:**
1. Getting customer BOM data
2. Email and RFQ not done properly; CBMs not using RFQ
3. Approval process unclear
4. Customer communication improvised via Teams (was NPI DB)
5. PLM: not user friendly, missing progress bars, questionable results
6. Word wrapping missing in BOM comparison
7. No legend for BOM comparison colour coding (green = new, red = removed)
8. MPN field limited to 30 characters — needs extension
9. MPN string splitting not implemented

**What works:** BOM comparison with MOVEX when both BOMs sourced from MOVEX (IPN matching). DigiKey descriptions align with MOVEX.

**BOM comparison logic:** CPN/Alias first → MPN second. PN comparison: full match / partial match / no match.

**Technical:** PDPBom replication job on 10.40.10.42; cadence every 2 hours proposed. Rev updates are manual via PDS001.

---

## Session 5 — 21/01/2026: DISP / Defence Readiness (Devian)

DISP (Defence Industry Security Program, based on ISO 27005 / Essential Eight) is the path to defence sector contracts:
- Safran is a defence prospect
- John Ferrieks wants to enter defence
- SRX has recently become a Public Company

A consultant (DiStefano, ~$24K) was proposed. Decision: internal ICT gap analysis by Karen first before committing. *(ADR-022)*

Devian's recommendation: start with Essential Eight, ISO 27005 review, internal training audit (Dozier), physical security.
Marriat (Scanfil) to advise on leveraging Scanfil ICT for DISP.
MES procedure expiry alignment (Mihai) is a parallel issue with DISP relevance.

---

## Strategy Flags — REVIEW REQUIRED

### 1. PLM/Stargile is an active parallel IT workstream — not reflected in IT portal strategy

The documented IT strategy (`strategy/it-portal-priority-ordering-myinvois-then-ecn-then-other.md`) focuses exclusively on portal project sequencing (MyInvois → ECN → other). However, this Melbourne visit shows a substantial active workstream in PLM/Stargile (BOM comparison, roadmap, MPN fixes, replication jobs). This is not a contradiction — PLM is a different team/system — but PLM is absent from the IT strategy entirely. The strategy may need a clause acknowledging parallel non-portal workstreams.

### 2. DISP / Defence readiness is a new strategic direction with no vault coverage

The strategy documents do not mention DISP, defence contracts, or SRX's public company status. If the executive team is serious about pursuing Safran and other defence contracts, this represents a material IT strategy expansion that needs to be formalised.

### 3. Scanfil merger uncertainty is a material uncaptured strategic risk

The strategy assumes SRX IT continues operating with its current structure and tooling. Nick's concerns about merger chaos and the lack of a visible integration plan are not reflected anywhere in strategy or risk documents (beyond the new risk note created in this mining pass).

---

## Action Items

| Owner | Action |
|-------|--------|
| Xray team / Mihai | Integrate Xray machine to update MOVEX stock directly — remove Sandra manual entry |
| NickN | Create a Teams PLM Roadmap for Stargile UX improvements |
| Karen | Complete ICT cost and gap analysis for DISP |
| Mihai | Align MES procedure expiry dates with Scanfil standard |
| Sourcing team | Update Lead Times in MOVEX (MSP) |
| IT / Mgmt | Identify key accountability members for OTD confirmation — who does what by when |
| Karen | Investigate Scanfil ICT leverage for DISP via Marriat |

---

## Vault Actions Taken (this mining pass)

| Type | File |
|------|------|
| Decision | `decisions/movex-is-single-source-of-truth-for-stock-balances.md` (ADR-020) |
| Decision | `decisions/customer-otd-first-confirmed-date-is-official-kpi-for-2026.md` (ADR-021) |
| Decision | `decisions/disp-internal-gap-analysis-precedes-external-consultant-engagement.md` (ADR-022) |
| Decision | `decisions/plm-stargile-roadmap-and-ux-fixes-required-before-broader-adoption.md` (ADR-023) |
| Project | `projects/plm-stargile-bom.md` (new) |
| Project | `projects/disp-defence-readiness.md` (new) |
| Risk | `risks/scanfil-merger-integration-proceeds-without-clear-plan-causing-operational-chaos.md` |
| Risk | `risks/xray-manual-movex-stock-update-creates-inventory-accuracy-risk.md` |
| Risk | `risks/customer-order-delivery-confirmation-latency-exceeds-two-weeks.md` |
| Risk | `risks/mes-procedure-expiry-dates-not-aligned-with-scanfil-standard.md` |
| Risk | `risks/plm-low-adoption-creates-bom-data-quality-risk.md` |
| Risk | `risks/disp-ict-security-gaps-block-defence-contract-eligibility.md` |
| M3 knowledge | `m3-knowledge/transactions/pds001-part-revision-manual-update.md` |
| Vendor | `vendors/stargile.md` (new) |
| KPI update | `kpis/otd-on-time-delivery.md` — definition confirmed, date types added, ADR-021 linked |
