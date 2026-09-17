#!/usr/bin/env bash
# Hacker News search via the official Algolia API. No auth.
# usage: hn.sh "<query>" [days=120] [min_points=100]
# output: points  comments  date  title  url
set -euo pipefail
q="${1:?usage: hn.sh \"<query>\" [days] [min_points]}"; days="${2:-120}"; minp="${3:-100}"
ts=$(python3 -c "import time;print(int(time.time())-$days*86400)")
curl -sS -m 20 -G "https://hn.algolia.com/api/v1/search" \
  --data-urlencode "query=$q" --data-urlencode "tags=story" \
  --data-urlencode "numericFilters=points>$minp,created_at_i>$ts" \
| python3 -c '
import sys,json
try: hits=json.load(sys.stdin).get("hits") or []
except Exception: hits=[]
for h in hits:
    pts=h.get("points") or 0; nc=h.get("num_comments") or 0; dt=h["created_at"][:10]
    title=(h.get("title") or "")[:80]; url="https://news.ycombinator.com/item?id="+h["objectID"]
    print(f"{pts:>5}  {nc:>4}  {dt}  {title}  {url}")
'
