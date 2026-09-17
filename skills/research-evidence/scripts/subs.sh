#!/usr/bin/env bash
# Subreddits whose name starts with a word, by subscribers, via the Arctic Shift
# archive. Turns a topic word into candidate venues for reddit.sh. Prefix match
# only: "photo" finds r/photography but not r/AskPhotography.
# usage: subs.sh <name prefix> [limit=15]
# output: subscribers  name  description
set -euo pipefail
prefix="${1:?usage: subs.sh <name prefix> [limit]}"; limit="${2:-15}"
url="https://arctic-shift.photon-reddit.com/api/subreddits/search?subreddit_prefix=$(python3 -c "import urllib.parse,sys;print(urllib.parse.quote(sys.argv[1]))" "$prefix")&limit=$limit"
"$(dirname "$0")/arctic-fetch.sh" "$url" | python3 -c '
import sys,json
try: j=json.load(sys.stdin); d=j.get("data") or []
except Exception: j={}; d=[]
if not d and j.get("error"): print("archive error:", j["error"], file=sys.stderr)
for s in sorted(d,key=lambda s:-(s.get("subscribers") or 0)):
    desc=(s.get("public_description") or s.get("title") or "").replace("\n"," ")[:70]
    n=s.get("subscribers") or 0; name=s["display_name"]
    print(f"{n:>9}  r/{name}  {desc}")
'
