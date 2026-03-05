---
program: PDS001
type: MI
description: "Part revision manual update — used to manually update the revision (Rev) level on a part/item record in MOVEX"
key_fields:
  - REV: "Revision identifier (e.g. A, B, C) — the current engineering revision of the part"
  - ITNO: "Item number / Part number (PN)"
known_quirks:
  - "Revision updates are manual via PDS001 — there is no automated trigger from PLM/Stargile to update the Rev field in MOVEX when a BOM revision is approved in PLM"
  - "This manual step is a pain point in the PLM/ECN workflow — engineers must update MOVEX separately after any change in Stargile"
  - "None other observed yet"
related_programs: []
last_verified: 2026-01-21
---

## Overview

PDS001 is used to manually update the Revision (Rev) field on item/part records in MOVEX. It is called out in the PLM/BOM workflow as a step that must be performed by hand when an engineering change is made in Stargile.

---

## Usage Context

In the PLM/BOM workflow at SRX:

1. Engineering change is documented in Stargile (PLM)
2. BOM is updated in Stargile
3. **Manual step required**: engineer or IT must run PDS001 to update the Rev field in MOVEX to match the new revision

This manual step was flagged as a known integration gap in the 2026-01-21 Melbourne Stargile/PLM session.

---

## Related

- Decision ADR-023: PLM Stargile roadmap and UX fixes
- Decision ADR-017 (ECN rewrite): Automating MOVEX component creation when ECN approved
- Project: `projects/plm-stargile-bom.md`
- Project: `projects/sm-portal-ecn-rewrite.md`
