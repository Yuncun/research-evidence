# research-evidence

A Claude Code / agent skill for prior-art and build-versus-adopt decisions, and for questions about adoption or effectiveness.

It compares existing options using primary sources, dated usage, and maintenance evidence. Popularity helps discover candidates; it does not prove that an approach works better, particularly for a specific model.

The identifier remains `research-evidence`. It is not a prerequisite for every tooling change or agent-related question. Documentation lookup, local-code explanation, troubleshooting, and implementation of a settled choice do not trigger an adoption study.

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

Prefer available search/browser tools and the official `gh` CLI. The legacy scripts are optional adapters needing `curl`, `python3`, and `gh` (logged in). They have known failure-reporting gaps; see [access notes](skills/research-evidence/references/access.md). Their empty output must not be treated as evidence that no alternatives exist.

## It's working if

- Build-versus-adopt questions receive a comparison of relevant existing options.
- Documentation, debugging, and settled implementation requests stay direct.
- Adoption counts are dated and cited where they help; effectiveness claims need direct evidence.
- Thin evidence or failed source access is reported as a limitation, not proof of absence.

## Evals

`evals/` holds cases in the `claude plugin eval` layout. Until that command is available, run each `prompt.md` in a fresh agent with and without the skill and grade against `graders/`. Cases are drawn from real turns where the answer was wrong; `gap-claim-in-context` is the multi-part turn that first failed.

## License

MIT
