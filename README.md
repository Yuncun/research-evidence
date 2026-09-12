# prior-art

Skill to search for online communities (reddit, hn, etc.) to look for evidence of human adoption and recency when looking for a technical solution to a problem. 

 This skill supplements the existing agent search, and runs an extra pass to look at a bunch of online communites to look for humans having the same issue or question that you have, so that you dont catastrophically miss an obvious solution because your agent has adhd and overthoguht the hell out of a simple question. 

## Install

For Copilot, Claude Code, and other supported agents:

```bash
npx skills add Yuncun/prior-art --skill prior-art
```

Copilot can also install the single file directly:

```bash
copilot skill add https://raw.githubusercontent.com/Yuncun/prior-art/main/skills/prior-art/SKILL.md
```

## License

MIT
