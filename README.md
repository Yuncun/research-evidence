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

## License

MIT
