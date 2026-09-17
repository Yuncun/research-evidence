---
name: "gap-claim-in-context"
runs: 2
max_turns: 30
timeout_seconds: 900
allowed_tools: ["Bash", "WebSearch", "WebFetch", "Skill", "Read"]
---
I keep my personal agent tooling for a repo (auth helper scripts, my own rules, loop guards) in a gitignored .harness/ folder. I like this a lot better than the manifest-and-separate-repo thing I built before. Three questions. (1) Is this a pre-agent convention, dotfiles at the project level? I don't understand your earlier point that chezmoi and stow are a home-directory convention; is the standard really to keep per-project personal rules in home? (2) What is .env for, is that where personal per-project prefs conventionally go, or is it build config? (3) Is there an AGENTS.md-like standard for a project-level personal steering file that tools pick up by default?
