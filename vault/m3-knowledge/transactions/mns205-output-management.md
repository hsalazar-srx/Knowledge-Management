---
program: MNS205
type: MI
description: "Output Management — defines where M3-generated documents (delivery notes, invoices, reports) are routed per user and document type, including email destinations"
key_fields:
  - USID: "User identity — the M3 user whose output routing is configured"
  - DEVD: "Device/destination — output device or email address for document delivery"
known_quirks:
  - "Email addresses in MNS205 can be incorrectly configured at user creation time — if a new user's MNS205 entries are set up incorrectly, documents route to the wrong recipient or bounce. Observed for a JB warehouse user (2026-02-11): delivery notes were going to incorrect email addresses that did not belong to the user"
  - "To diagnose a misconfiguration, compare the suspect user's entries to a known-valid user in the same division — differences in device/email configuration reveal the problem"
  - "Division context matters when reviewing entries — be conscious of which division you are working in when comparing users"
related_programs: []
last_verified: 2026-02-11
---

## Overview

MNS205 is the Output Management program in MOVEX (M3). It controls document routing: for each user, it defines which printer, device, or email address receives each type of M3-generated output (delivery notes, invoices, purchase orders, etc.).

---

## Common Use Cases

- Configure where delivery notes are emailed for warehouse users
- Troubleshoot missing or bounced M3 output documents
- Audit email routing when users report they are not receiving expected output

---

## Troubleshooting Output Routing Issues

1. Open MNS205 for the affected user
2. Identify the document type that is not arriving (e.g., delivery notes)
3. Compare all entries for this user to a known-valid user in the same division
4. Look for incorrect email addresses, missing entries, or entries that belong to a different user
5. Correct the email/device destination
6. Test by reissuing the document

---

## Known Issue (2026-02-11)

Karen Lewin identified that a Johor Bahru (JB) warehouse user had incorrect email addresses configured in MNS205 — the email addresses did not belong to that user. Suspected root cause: error in the user creation/setup process. Delivery notes for that user were routing to wrong recipients or bouncing.

---

## Related

- Risk: `risks/m3-output-management-misconfiguration-routes-documents-to-wrong-recipients.md`
