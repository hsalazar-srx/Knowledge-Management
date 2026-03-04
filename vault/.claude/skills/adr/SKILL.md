# /adr — Architecture Decision Record

Structure a new Architecture Decision Record for a significant technical decision. Check existing ADRs first to avoid duplicates or conflicts.

## Instructions

1. Check `decisions/` for any existing ADR on this topic — if found, amend it rather than creating a new one
2. Determine the next ADR number by listing existing files in `decisions/`
3. Classify reversibility:
   - **Type-1 irreversible**: Cannot be undone without significant cost (DB migrations, external API contracts, removal of a service, IFS migration commitment). Review cycle: 90 days.
   - **Type-2 reversible**: Can be changed with reasonable effort (framework choice, internal architecture pattern, configuration approach). Review cycle: 60 days.
4. Extract or prompt for:
   - The decision statement (proposition, not topic)
   - At least two alternatives considered (and why they were rejected)
   - All assumptions the decision relies on (each must be testable)
   - Which projects are affected
   - Links to any decisions this supersedes
5. Set `review_date` based on reversibility classification
6. Create the ADR file in `decisions/` with proposition filename
7. If this supersedes an existing ADR: update the old ADR's `status: superseded` and add `superseded_by: {new file}`

## Decision Template

```markdown
---
id: ADR-{NNN}
decision: "{Proposition: Subject + verb + object}"
status: decided
date: {today}
reversibility: type-1-irreversible | type-2-reversible
review_date: {today + 90 days or 60 days}
assumptions:
  - "{Testable assumption 1}"
  - "{Testable assumption 2}"
alternatives:
  - "{Alternative A} — rejected because {specific reason}"
  - "{Alternative B} — rejected because {specific reason}"
dependents: []
projects:
  - "{affected project}"
---

## Context

{Why this decision was needed. What problem it solves. What the alternatives were and why they were insufficient.}

## Decision

{The chosen approach. Enough detail that someone unfamiliar with the context can implement it correctly.}

## Consequences

**Positive:**
- {Expected benefit}

**Negative / trade-offs:**
- {Known cost or constraint}

## Review Criteria

This decision should be reviewed if:
- {Condition that would change the calculus}
- {External dependency that might change}
```

## Quality Gates

- ADR number is sequential (no gaps, no duplicates)
- `assumptions` field is non-empty — every decision has at least one testable assumption
- `alternatives` lists at least two options with rejection reasons
- `reversibility` is explicitly classified
- `review_date` matches the reversibility classification
- If superseding an existing ADR: the old ADR is updated before the new one is saved
- Filename is a proposition, not a topic
