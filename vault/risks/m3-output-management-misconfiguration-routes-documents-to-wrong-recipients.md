---
risk: "M3 output management misconfiguration routes documents to wrong recipients or causes them to bounce"
category: operational
likelihood: medium
impact: moderate
status: active
reviewed: 2026-02-11
early_warnings:
  - "Users report not receiving expected M3 output (delivery notes, invoices, purchase orders)"
  - "Documents confirmed sent in M3 but not arriving at destination"
  - "Email bounce notifications for M3-generated documents"
  - "New user setup completed recently — MNS205 entries not validated post-creation"
mitigations:
  - "Audit MNS205 entries for all active users — compare email addresses to HR/directory data to identify mismatches"
  - "Add MNS205 configuration validation to new user onboarding checklist"
  - "Compare suspect user's MNS205 entries to a known-valid user in the same division to identify discrepancies"
contingency:
  - "Manually distribute affected documents (delivery notes, etc.) via email or physical copy while MNS205 is corrected"
  - "Escalate to Max Wittmann / MOVEX team if MNS205 correction is beyond local IT capability"
---

## Context

On 2026-02-11, Karen Lewin identified that a Johor Bahru (JB) warehouse user had incorrect email addresses configured in MNS205 (Output Management). The email addresses in MNS205 did not belong to the user, suggesting the entries were either copied from another user or incorrectly entered during user creation.

As a result, delivery notes for that user were routing to the wrong recipient or bouncing.

## Observed Instance

- **Division:** Johor Bahru (JB)
- **User type:** Warehouse (old/ex-staff account or new user with bad setup)
- **Affected document type:** Delivery notes
- **Symptom:** Documents not arriving; email entries in MNS205 do not match the user
- **Status:** Karen Lewin to investigate and correct via MNS205; will escalate to Max Wittmann if unresolved

## Risk Scope

This is likely not an isolated incident. If the user creation process does not include MNS205 validation, similar misconfigurations may exist for other users across divisions.

## Related

- M3 program: `m3-knowledge/transactions/mns205-output-management.md`
