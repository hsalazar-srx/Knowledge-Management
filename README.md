# SRX Manufacturing Knowledge Vault

An organizational memory system for SRX Manufacturing's IT environment. Based on Cornelius's AI-assisted knowledge management framework, adapted for MOVEX M3 ERP, MyInvois/LHDN compliance, and the MAS v2.0 agent ecosystem.

The vault captures two things most organizations lose: **meeting knowledge** (decisions, risks, M3 tribal knowledge, vendor signals) and **code knowledge** (what changed in each project, what assumptions a commit reveals or breaks). Together they keep strategy, assumptions, and documentation aligned with what is actually happening in the codebase.

---

## What This Is

```
vault/
├── decisions/          ADRs and architecture/process decisions (linked assumptions, reversibility)
├── strategy/           IT strategy as falsifiable claims
├── transcripts/        Drop zone for meeting recordings
│   └── commits/pending/ Git commit events (auto-populated by post-commit hooks)
├── m3-knowledge/
│   ├── transactions/   M3 MI program docs (fields, quirks, examples)
│   └── tables/         MOVEX table schemas (OHEDCO, MITMAS, FGINHE …)
├── compliance/         LHDN/MyInvois SDK rules, ISO 27001 controls
├── risks/              Operational, compliance, supply-chain, project risks
├── projects/           Active project tracking (MyInvois Phase 1, WMS, PLM …)
├── kpis/               DIFOT%, OTD, inventory turns, compliance SLAs
├── vendors/            Living profiles: Infor, LHDN portal, Microsoft
├── runbooks/           IIS deployment, certificate management, troubleshooting
├── reviews/            Agent-generated health reports
└── archive/            Processed transcripts and meeting summaries
```

---

## Getting Started

### 1. Clone and initialise the vault as a git repository

```bash
cd c:/Projects/Knowledge-Management
git init
git add .
git commit -m "feat: initialise SRX manufacturing knowledge vault"
```

### 2. Install commit hooks in all companion projects

```bash
cd c:/Projects/Knowledge-Management
bash scripts/install-hooks.sh
```

This installs a lightweight post-commit hook into:
- `c:/Projects/MOVEX/API-Integration/movex-rest-api`
- `c:/Projects/MyInvois-Service`
- `c:/Projects/SM-Portal`
- `c:/Projects/PLM/PLMServer`
- `c:/Projects/WMS` (when present)
- `c:/Projects/DIFOT` (when present)
- `c:/Projects/Reporting-Service` (when present)

The hook appends a YAML event file to `vault/transcripts/commits/pending/` after every commit in those projects. No network calls, no dependencies — it runs silently.

### 3. Open the vault in Claude Code

Open `c:/Projects/Knowledge-Management` in Claude Code. The `session-orient.sh` hook fires automatically and reports the vault's health:

```
=== SRX Manufacturing Knowledge Vault ===
Session: 2026-03-04

PENDING QUEUE
  ⚠  2 pending commit event(s) — run /mine-commits

Skills available: /mine  /mine-commits  /review  /adr  /m3-lookup  /compliance-check  /runbook
==========================================
```

---

## Daily Workflow

```
1. Open Claude Code in vault/
   → session-orient.sh fires, shows what needs attention

2. If pending commits:
   → /mine-commits
   → Vault updates with project changes, flagged decisions, risk signals

3. If unmined transcripts in transcripts/:
   → /mine {filename}
   → Decisions, risks, M3 knowledge, vendor signals extracted automatically

4. Weekly:
   → /review
   → Full health report: KPIs, stale notes, overdue ADR reviews, compliance gaps
```

That is the complete maintenance loop. The vault keeps itself alive as long as commits flow and transcripts land.

---

## Skills Reference

| Skill | When to use | What it does |
|-------|-------------|-------------|
| `/mine` | After dropping a meeting transcript in `transcripts/` | Extracts decisions, risks, M3 knowledge, compliance updates, vendor signals, action items. Creates atomic notes per vault schema. |
| `/mine-commits` | When `session-orient` reports pending commits | Processes commit events: `feat:` → project updates; `fix:` → flags stale decisions; `adr:` → creates ADR; compliance file changes → flags compliance notes. |
| `/review` | Weekly | Full vault health report: KPI computation, stale decisions, overdue reviews, blocked projects, vendor profile staleness, strategy drift. |
| `/adr` | When a significant tech decision is made | Creates a structured ADR with assumptions, alternatives, reversibility classification, and review date. Checks for duplicates first. |
| `/m3-lookup` | Before building an M3 integration or checking field definitions | Searches `m3-knowledge/` for program documentation, field definitions, table schemas, and known quirks. |
| `/compliance-check` | Monthly, or when LHDN releases a new SDK version | Cross-references compliance notes against current LHDN SDK version; flags gaps in decisions; surfaces compliance risks near project go-lives. |
| `/runbook` | After a deployment or incident | Captures operational experience as a structured runbook entry with symptom, root cause, fix, and prevention. |

---

## Hooks Reference

Hooks live in `vault/.claude/hooks/`. They are not invoked manually — Claude Code invokes them automatically on the relevant events.

| Hook | When it fires | What it does |
|------|--------------|-------------|
| `session-orient.sh` | Every time you open Claude Code in the vault | Counts pending commit events and unmined transcripts; flags overdue decision reviews; flags stale vendor profiles; surfaces blocked projects; checks compliance note age. |
| `auto-commit.sh` | After every vault write operation | `git add . && git commit -m "vault: auto-sync [timestamp]"` — maintains complete version history. |
| `write-validate.sh` | When a new vault note is created | Validates YAML frontmatter schema: decisions need `assumptions`; risks need `early_warnings`; m3-knowledge needs `program`; compliance notes need `lhdn_sdk_version`. |

---

## Adding a New Project to the Commit Sync

When a new companion project starts (e.g., a new WMS module, a reporting service):

```bash
# Install the hook into the new project
bash scripts/install-hooks.sh /path/to/new/project

# Verify the hook is installed
cat /path/to/new/project/.git/hooks/post-commit
```

Then make a test commit in the new project and verify a YAML event file appears in `vault/transcripts/commits/pending/`.

To add the project to the default list (so it's included in future `install-hooks.sh` runs without specifying a path), edit `scripts/install-hooks.sh` and add the path to the `COMPANION_PROJECTS` array.

---

## Adding Knowledge Manually

### File naming convention

Filenames are propositions, not topics:

- `db2-direct-access-preferred-over-m3-api-for-myinvois.md` — good
- `db2-decision.md` — bad

A person reading the directory listing should understand the decision without opening any file.

### YAML frontmatter schemas

**Decision / ADR:**
```yaml
---
id: ADR-NNN
decision: "Proposition"
status: decided
date: YYYY-MM-DD
reversibility: type-1-irreversible | type-2-reversible
review_date: YYYY-MM-DD
assumptions:
  - "Testable assumption"
alternatives:
  - "Alternative — rejected because…"
dependents: []
projects: []
---
```

**Risk:**
```yaml
---
risk: "Scenario"
category: compliance | operational | supply-chain | project | infrastructure
likelihood: low | medium | high
impact: low | moderate | critical
status: active | mitigated | closed
reviewed: YYYY-MM-DD
early_warnings:
  - "Observable signal"
mitigations:
  - "Concrete action"
contingency:
  - "Fallback"
---
```

**M3 Transaction:**
```yaml
---
program: XXXMI
type: MI
description: "What it does"
key_fields:
  - FIELDNAME: "Description (length, type)"
known_quirks:
  - "Quirk from experience"
related_programs: []
last_verified: YYYY-MM-DD
---
```

---

## Maintenance Cadence

| Task | Cadence | Skill |
|------|---------|-------|
| Process pending commit events | As prompted by session-orient | `/mine-commits` |
| Mine meeting transcripts | After each relevant meeting | `/mine` |
| Vault health review | Weekly | `/review` |
| Compliance check | Monthly + after LHDN announcements | `/compliance-check` |
| Vendor profile audit | Per vendor monitoring priority (14/30/90 days) | Manual + `/review` |
| Decision review | As per `review_date` in each ADR | `session-orient` surfaces these |
| IFS migration readiness | When migration planning starts | `/adr` + `/review` |

**The vault stays alive as long as you mine. The commit hooks ensure code changes flow in automatically. The skills ensure meeting knowledge flows in with one command.**

---

## MAS v2.0 Connection

The vault is maintained by `expert-knowledge-manager` (domain-expert tier, MAS v2.0). All other agents can query it:

| Agent | What they query |
|-------|----------------|
| `expert-movex-dotnet` | `m3-knowledge/` for field definitions before building transactions |
| `expert-myinvois-compliance` | `compliance/` for LHDN rules; `decisions/` for MyInvois ADRs |
| `architect-system-design` | `decisions/` to avoid duplicating or contradicting existing ADRs |
| `developer-dotnet` / `developer-integration` | `decisions/` and `runbooks/` for IIS deployment patterns |
| `orchestrator-project` | `projects/`, `kpis/`, `risks/` for project health overview |

Agent registry: [`c:/Projects/.github/agents/manifest.json`](../../../.github/agents/manifest.json)
Skills registry: [`c:/Projects/.github/skills/manifest.json`](../../../.github/skills/manifest.json)

---

## Troubleshooting

**Post-commit hook is not firing**

Check that the hook is installed and executable:
```bash
ls -la /path/to/project/.git/hooks/post-commit
# Should show: -rwxr-xr-x
```

If not executable: `chmod +x /path/to/project/.git/hooks/post-commit`

Check that the vault path in the hook matches your installation:
```bash
head -20 /path/to/project/.git/hooks/post-commit
# Should show: KM_VAULT="c:/Projects/Knowledge-Management/vault"
```

**YAML validation failure on a new note**

Run `write-validate.sh` manually to see the specific error:
```bash
bash vault/.claude/hooks/write-validate.sh vault/decisions/my-decision.md
```

The output will list each missing field with the exact field name and expected format.

**session-orient.sh shows wrong date comparisons on Windows**

The hook uses `date -d` (GNU date). On Windows with Git Bash, this is usually available. If not, install GNU coreutils or use WSL. The hook will skip date comparisons gracefully if `date -d` is unavailable — it will still count pending files.

**Vault note was created but not committed**

Run `auto-commit.sh` manually:
```bash
bash vault/.claude/hooks/auto-commit.sh
```

If git is not initialised: `cd vault && git init && git add . && git commit -m "feat: initialise vault"`

**A compliance note is flagged as stale but the content is still current**

Update `last_reviewed` to today's date in the frontmatter and run `write-validate.sh` to confirm the note is schema-valid.
