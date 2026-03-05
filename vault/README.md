# SRX Manufacturing — Knowledge Vault

Organizational knowledge for MOVEX, MyInvois-Service, SM-Portal, WMS, PLM, DIFOT, and Reporting-Service.

> **Obsidian setup:** Install the [Dataview](https://github.com/blacksmithgu/obsidian-dataview) community plugin to render the live tables below. Enable it in Settings → Community plugins.

---

## Active Projects

```dataview
TABLE project AS "Project", phase AS "Phase", status AS "Status", go_live AS "Go-Live", owner AS "Owner"
FROM "projects"
WHERE status != "completed"
SORT go_live DESC
```

---

## Open Decisions

```dataview
TABLE decision AS "Decision", status AS "Status", reversibility AS "Type", review_date AS "Review Date"
FROM "decisions"
WHERE status = "decided" OR status = "under-review"
SORT review_date ASC
```

---

## Active Risks

```dataview
TABLE risk AS "Risk", category AS "Category", likelihood AS "Likelihood", impact AS "Impact"
FROM "risks"
WHERE status = "active"
SORT impact DESC, likelihood DESC
```

---

## Compliance Notes

```dataview
TABLE topic AS "Topic", category AS "Category", lhdn_sdk_version AS "SDK Version", last_reviewed AS "Last Reviewed"
FROM "compliance"
SORT last_reviewed ASC
```

---

## M3 Knowledge

### Tables

```dataview
TABLE description AS "Description", schema AS "Schema", last_verified AS "Last Verified"
FROM "m3-knowledge/tables"
SORT file.name ASC
```

### Transactions

```dataview
TABLE description AS "Description", type AS "Type", last_verified AS "Last Verified"
FROM "m3-knowledge/transactions"
SORT file.name ASC
```

---

## Runbooks

```dataview
TABLE topic AS "Topic", projects AS "Projects", last_updated AS "Last Updated"
FROM "runbooks"
SORT last_updated DESC
```

---

## Unmined Transcripts

```dataview
TABLE file.mtime AS "Modified"
FROM "transcripts"
WHERE !contains(file.path, "commits/pending")
SORT file.mtime DESC
```

---

## Decisions Due for Review

```dataview
TABLE decision AS "Decision", review_date AS "Review Date", status AS "Status"
FROM "decisions"
WHERE review_date <= date(today) + dur(30 days)
SORT review_date ASC
```

---

## Risk Matrix

```dataview
TABLE risk AS "Risk", likelihood AS "Likelihood", impact AS "Impact", status AS "Status"
FROM "risks"
WHERE status = "active" 
```


*Vault agent: `expert-knowledge-manager` · Skills: `/mine` `/mine-commits` `/review` `/adr` `/m3-lookup` `/compliance-check` `/runbook`*
