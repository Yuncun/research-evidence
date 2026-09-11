# prior-art

A skill for checking existing software and built-in capabilities before introducing a new developer tool, dependency, automation, agent skill, or engineering workflow.

It triggers automatically on new tooling requests, including "build a custom tool," and on technical alternatives, provenance, maintenance, adoption, or effectiveness questions. It stays out of routine edits, debugging, explanations, settled implementation, general news, and nontechnical questions.

The goal is an informed build-versus-adopt decision, not a ban on custom code. A small script may fit better than a large dependency. Dated primary sources and first-hand usage matter; stars alone do not establish effectiveness.

## Install

For Copilot, Claude Code, and other supported agents:

```bash
npx skills add Yuncun/research-evidence --skill prior-art
```

While this replacement is awaiting merge, Copilot can install the single file from the review branch:

```bash
copilot skill add https://raw.githubusercontent.com/Yuncun/research-evidence/fix/scope-prior-art-research/skills/prior-art/SKILL.md
```

## Migration from research-evidence

The skill identifier is now `prior-art`. Remove the old installed `research-evidence` skill so both descriptions cannot trigger. Enable `prior-art` in your host if needed; disabling the old name does not disable the replacement.

The GitHub repository and Claude plugin package keep the `research-evidence` name for existing links and subscriptions. The plugin exports the new `prior-art` skill. Marketplace users receive it when this revision is released; the review-branch install above is available beforehand.

The replacement contains one `SKILL.md` and uses the agent's existing search tools. The old source-specific helper scripts are no longer distributed; their last version remains in Git history.

No always-loaded instruction is needed to force invocation. The skill's description owns its trigger when the host enables it.

## Evals

`evals/routing.json` contains positive and negative discovery cases. Give a fresh agent only the candidate description and each case's prompt; compare its invocation decision with `invoke`. Repeat with the previous description and vary the prompts. These are routing simulations, not proof of real tool invocation.

`evals/decision-fixture.md` supplies fictional primary evidence for an offline recommendation. Run it with and without the skill: choose the fitting built-in capability, distinguish popularity from model effectiveness, and preserve the failed-search limitation. A passing control means this fixture shows no added reasoning benefit from the skill.

The Markdown cases under `evals/` retain the original `claude plugin eval` layout. Run each `prompt.md` in a fresh agent and grade against its `graders/`. Also inspect actual skill calls in the target host: a correct written classification does not prove the host discovers and invokes the installed skill.

## License

MIT
