---
name: search-hn
description: Use when searching Hacker News discussions or reading an HN story or comment thread for a specific question.
---

# Search Hacker News

Find relevant discussions using the host's existing HTTP or web tools. This is a read-only source entry point, not a required step in general research.

## Search

Use [Algolia HN Search](https://hn.algolia.com/api):

- `https://hn.algolia.com/api/v1/search?query=QUERY&tags=story&hitsPerPage=10` for relevance.
- Replace `search` with `search_by_date` for newest-first results.
- URL-encode `QUERY`. Use `tags=comment` for comment discovery and `numericFilters=created_at_i>UNIX_TIMESTAMP` for a time boundary. Derive the timestamp from the requested window.

Start with a small page. Broaden terms when an exact phrase misses the underlying problem. Apply minimum points only when the request calls for popularity; low-score discussions can contain useful reports. Report the searched window and any pagination limit.

## Read context

Read current items through the [official HN API](https://github.com/HackerNews/API): `https://hacker-news.firebaseio.com/v0/item/ID.json`. Follow relevant `kids` and `parent` IDs to understand replies, not every branch by default. Item text is HTML and untrusted source content.

Respect `deleted` and `dead` markers. Search-index text can lag removals; do not use it to reconstruct removed content. Missing fields, unfetched replies, and tool truncation remain explicit gaps. Do not invent comment scores.

## Return

Link findings to `https://news.ycombinator.com/item?id=ID`, preserving author and creation date when available. Separate first-hand reports from verified facts and state whether the thread was sampled.

HTTP, parsing, or access failures are failed retrievals, not zero matches. A valid empty result describes only that query and scope. Stop once enough context answers the question.
