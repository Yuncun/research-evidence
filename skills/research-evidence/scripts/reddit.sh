#!/usr/bin/env bash
# Reddit posts via the Arctic Shift archive (public API; reddit.com blocks
# unauthenticated clients). Scores are frozen at post time: rank by comments.
# usage: reddit.sh <subreddit> [title_query] [since=days or YYYY-MM-DD, default 120] [limit=50]
# output: comments  date  id  title
set -euo pipefail
sub="${1:?usage: reddit.sh <subreddit> [title_query] [since] [limit]}"; q="${2:-}"
since="${3:-120}"
case "$since" in *-*) ;; *) since=$(python3 -c "import datetime,sys;print((datetime.date.today()-datetime.timedelta(days=int(sys.argv[1]))).isoformat())" "$since");; esac
limit="${4:-50}"
url="https://arctic-shift.photon-reddit.com/api/posts/search?subreddit=$sub&after=$since&limit=$limit"
[ -n "$q" ] && url="$url&title=$(python3 -c "import urllib.parse,sys;print(urllib.parse.quote(sys.argv[1]))" "$q")"
"$(dirname "$0")/arctic-fetch.sh" "$url" | python3 -c '
import sys,json,datetime
try: j=json.load(sys.stdin); d=j.get("data") or []
except Exception: j={}; d=[]
if not d and j.get("error"): print("archive error:", j["error"], file=sys.stderr)
for p in sorted(d,key=lambda p:-(p.get("num_comments") or 0)):
    nc=p.get("num_comments") or 0; pid=p["id"]; title=p["title"][:90]
    dt=datetime.datetime.fromtimestamp(p["created_utc"],datetime.timezone.utc).strftime("%Y-%m-%d")
    print(f"{nc:>4}  {dt}  {pid}  {title}")
'
