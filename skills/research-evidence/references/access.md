# Access notes

Historical access routes and optional helper scripts. Dates below are when a
route was last verified, not a guarantee that it works now.

## Helper reliability

These adapters are not the skill's required execution path. Prefer available
search/browser tools and official `gh` commands.

The current helpers have known failure-reporting gaps:

- `hn.sh`, `reddit.sh`, `reddit-thread.sh`, and `x.sh` catch JSON errors and
  replace them with empty results or placeholder records.
- Most `curl` calls do not fail on HTTP error status.
- `gh-links.sh` replaces failed star-count lookups with zero.
- `agents-md.sh` suppresses request errors, making missing files difficult to
  distinguish from authentication or service failures.

An empty response from these helpers is not a valid negative research result.
Inspect the original service response or use another available access route.
These limitations have been identified by source inspection, not repaired or
covered by automated script tests in this revision.

| Source | Route | Auth | Notes |
|---|---|---|---|
| GitHub | `gh` CLI (official) | `gh auth login` | Code search: use the `filename:` qualifier; `path:` returns 0 on the legacy endpoint (2026-08-28) |
| Hacker News | `hn.algolia.com/api/v1` (HN's official search API) | none | `numericFilters` for points and date; `/items/<id>` returns the full tree |
| Reddit | `arctic-shift.photon-reddit.com` (community archive) | none, but needs a browser User-Agent | reddit.com blocks unauthenticated clients (`.json`, RSS, self-serve OAuth all closed as of 2026-07). Archive `score` is frozen at post time; `num_comments` is the usable signal. `title=` search is fast; `query=` full-text often times out. Returns `{"data":null,"error":"Timeout"}` under load |
| X | `api.fxtwitter.com` (public FixTweet API) | none | Reads one post or profile, including long-form X articles. No search: discover posts with a web search using `site:x.com`. Nitter and xcancel search return empty pages |

## Alternatives checked (2026-08-28)

Replace a script with a maintained tool when one over 1k stars works without a
paid key.

| Source | Candidate | Stars | Why not yet |
|---|---|---|---|
| GitHub | github/github-mcp-server | 32k | `gh` already covers it |
| HN | pskill9/hn-server and similar MCPs | under 50, last push 2024 | thin wrappers over the same Algolia API |
| Reddit | karanb192/reddit-mcp-buddy | 807 | anonymous mode reads reddit.com RSS (blocked) and returns null scores |
| Reddit | ismailsaoulaj/reddit-mcp-server | 33 | falls back to Arctic Shift; same call as `reddit.sh` |
| X | rafaljanicki/x-twitter-mcp-server | 35 | needs a paid X API key |
| All | mvanhorn/last30days-skill | 60k | uses the same HN and Arctic Shift endpoints; aimed at trend and person research, 2k-line instruction file |
