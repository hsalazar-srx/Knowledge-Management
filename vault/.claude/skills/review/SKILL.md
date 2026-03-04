# /review — Vault Health Report

Compute a full health report across all vault sections. Surface what needs attention before the next session.

## Instructions

1. **Pending queue** — count files in `transcripts/` (unmined transcripts) and `transcripts/commits/pending/` (pending commit events)
2. **Decision health** — scan all files in `decisions/`:
   - Flag any where `review_date` has passed
   - Flag any where `status: under-review` (awaiting resolution)
   - Count decisions per project
3. **Risk health** — scan all files in `risks/`:
   - Flag any with `status: active` and `reviewed` date > 30 days ago
   - Flag any with `likelihood: high` and `impact: critical`
4. **Project health** — scan all files in `projects/`:
   - Surface any with `status: blocked`
   - Surface any where `go_live` has passed but `status` is not `completed`
5. **KPI computation** — for each file in `kpis/`, run the defined computation and compare to target
6. **Compliance health** — scan all files in `compliance/`:
   - Flag any where `last_reviewed` is > 60 days ago
   - Flag any where `lhdn_sdk_version` does not match the current known SDK version
7. **Vendor profile staleness** — scan all files in `vendors/`:
   - High-priority: flag if `last_reviewed` > 14 days
   - Medium-priority: flag if `last_reviewed` > 30 days
   - Low-priority: flag if `last_reviewed` > 90 days
8. **Strategy drift** — compare claims in `strategy/` against recent commit events and transcript summaries in `archive/`. Surface any gaps.
9. **M3 knowledge gaps** — list any transaction programs referenced in `decisions/` or `projects/` that do not have a corresponding note in `m3-knowledge/transactions/`

## Output Report Format

```
=== VAULT HEALTH REPORT — {date} ===

PENDING QUEUE
  Unmined transcripts:    N  (run /mine to process)
  Pending commit events:  N  (run /mine-commits to process)

DECISIONS
  Total decisions:        N
  Overdue reviews:        N  → {list filenames}
  Under review:           N  → {list filenames}

RISKS
  Active high-critical:   N  → {list filenames}
  Stale (>30 days):       N  → {list filenames}

PROJECTS
  Blocked:                N  → {list project names}
  Overdue go-live:        N  → {list project names}

KPIS
  {KPI name}: {current} / {target} ({progress}%)
  ...

COMPLIANCE
  Stale notes (>60 days): N  → {list filenames}
  SDK version mismatch:   N  → {list filenames}

VENDORS
  Stale profiles:         N  → {list vendor names}

STRATEGY DRIFT
  Signals detected:       N  → {descriptions}

M3 KNOWLEDGE GAPS
  Missing transaction docs: {list program names}

RECOMMENDED ACTIONS (priority order):
1. {highest priority action}
2. ...
```

## Quality Gates

- All vault sections are checked — no section skipped
- KPI computations show both current value and how it was computed
- Recommendations are ordered by urgency, not alphabetically
- Report is saved to `reviews/health-report-{YYYY-MM-DD}.md`
