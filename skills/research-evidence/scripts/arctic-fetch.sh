#!/usr/bin/env bash
# Fetch one Arctic Shift URL with a body-aware retry and a one-hour cache.
# The archive signals overload as HTTP 200 + {"error":"Timeout"}, which curl's
# --retry never sees; this retries on that body with backoff (3s, 8s, 15s).
# usage: arctic-fetch.sh <url>      cache: $TMPDIR/research-evidence-cache/
set -euo pipefail
url="${1:?usage: arctic-fetch.sh <url>}"
cache="${TMPDIR:-/tmp}/research-evidence-cache"; mkdir -p "$cache"
key="$cache/$(printf '%s' "$url" | shasum | cut -c1-40).json"
if [ -f "$key" ] && [ -n "$(find "$key" -mmin -60 2>/dev/null)" ]; then cat "$key"; exit 0; fi
for wait in 0 3 8 15; do
  sleep "$wait"
  body=$(curl -sS -m 40 -A "Mozilla/5.0" "$url" || true)
  case "$body" in
    *'"error":"Timeout'*|*'"error": "Timeout'*|"") continue ;;
  esac
  printf '%s' "$body" > "$key"; printf '%s' "$body"; exit 0   # only successes are cached
done
printf '%s' "${body:-{\"data\":null,\"error\":\"Timeout\"}}"
