---
name: "build-decision"
runs: 2
max_turns: 30
timeout_seconds: 900
allowed_tools: ["Bash", "WebSearch", "WebFetch", "Skill", "Read"]
---
Should I build a custom video-generation pipeline, or adopt an existing ComfyUI workflow? I need first-frame and last-frame conditioning with Wan 2.2. Compare maintained options before recommending an approach.
