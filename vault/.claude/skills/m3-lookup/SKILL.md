# /m3-lookup — M3 Knowledge Query

Search `m3-knowledge/` for transaction documentation, field definitions, table schemas, and known quirks.

## Instructions

Given a query (program name, field code, table name, or description), do the following:

1. Check `m3-knowledge/transactions/` for files matching the program name
2. Check `m3-knowledge/tables/` for files matching the table name
3. If found: return the full note content
4. If not found: note the gap and prompt to create a new entry

### Query Patterns

| Query format | Where to search |
|-------------|-----------------|
| `MMS200MI` (program code) | `m3-knowledge/transactions/MMS200MI.md` |
| `GetItmBasic` (transaction name) | Search within transaction files for matching transaction |
| `ITNO` (field code) | Search all transaction and table files for field definitions |
| `MITMAS` (table name) | `m3-knowledge/tables/MITMAS.md` |
| `item master` (description) | Full-text search across all m3-knowledge files |

### Creating a New Entry

If the queried program or table does not exist, offer to create it with this template:

**Transaction template:**
```markdown
---
program: XXXMI
type: MI
description: "What it does (human-readable)"
key_fields:
  - FIELDNAME: "Description (max length, type: text|numeric|date|boolean)"
known_quirks:
  - "none observed yet"
related_programs: []
last_verified: {today}
---

## Overview

{What this program does. When to use it vs alternatives.}

## Transactions

### {TransactionName}

**Purpose:** {What it returns or does}
**HTTP method:** GET | POST
**Returns list:** yes | no

**Input fields:**
| Field | Length | Type | Required | Description |
|-------|--------|------|----------|-------------|
| CONO  | 3      | numeric | yes | Company number |

**Response fields:**
| Field | Length | Type | Description |
|-------|--------|------|-------------|

**Known issues:**
- {Any quirks, padding requirements, error codes}

**Example:**
\`\`\`json
{
  "CONO": "100",
  "ITNO": "ITEM001"
}
\`\`\`
```

## Output Format

```
M3 Lookup: {query}

Found: {program/table name}
File: m3-knowledge/{path}

{full content of the note}

---
Related:
- {link to related programs}
```

If not found:
```
M3 Lookup: {query}

Not found in vault.

Suggested action: Create m3-knowledge/transactions/{PROGRAM}.md
Would you like me to create a template? (yes/no)
```

## Quality Gates

- Never invent field definitions — only return what is documented in the vault
- If a note is marked `last_verified` > 180 days ago, flag it as potentially stale
- Known quirks are always included in the output, even if empty
- If multiple files match a query, list all matches before showing detail
