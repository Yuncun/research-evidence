# research-evidence

A Claude Code / agent skill for answering "what do people actually use for X?" with human evidence: recent threads, issues, stars, and dates, not the model's memory.

It adds to ordinary web search rather than replacing it. Sources are ranked by visible human adoption (points, comments, reactions, stars, push dates), every count is cited, and prior art is checked before anything gets hand-rolled.

## Install

Claude Code, as a plugin:

```
/plugin marketplace add Yuncun/yuncun-marketplace
/plugin install research-evidence@yuncun
```

Any agent that reads `SKILL.md` (Copilot, Codex, Cursor, ...), via [skills.sh](https://skills.sh):

```
npx skills add Yuncun/research-evidence
```

## What's inside

```
skills/research-evidence/
  SKILL.md          rules, search order, reporting format
  scripts/          hn, reddit, x, github helpers (bash + python3, no keys)
  references/       access routes per source, dated starting points
evals/              claude plugin eval cases
```

Scripts need `curl`, `python3`, and `gh` (logged in). Reddit is read through the Arctic Shift archive; X through fxtwitter; HN through Algolia. Nothing needs a paid key.

## It's working if

- Every source carries a date, and a count where one exists; vendor docs count as a source with no count.
- A decision to build is preceded by a table of what already exists.
- "No standard exists" or "only X has this" comes with the search that looked.
- Evidence quoted from memory or an earlier turn says so, with its age.

## Evals

`evals/` holds cases in the `claude plugin eval` layout. Until that command is available, run each `prompt.md` in a fresh agent with and without the skill and grade against `graders/`. Cases are drawn from real turns where the answer was wrong; `gap-claim-in-context` is the multi-part turn that first failed.

## License

MIT
