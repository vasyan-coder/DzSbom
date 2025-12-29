
#!/usr/bin/env bash
set -euo pipefail

OUT_PATH="${1:?Usage: $0 <output-file.json>}"

: "${DT_URL:?DT_URL is required (e.g. http://host:8081)}"
: "${DT_API_KEY:?DT_API_KEY is required}"
: "${DT_PROJECT_UUID:?DT_PROJECT_UUID is required}"

curl -sS -f \
  -H "X-Api-Key: $DT_API_KEY" \
  -o "$OUT_PATH" \
  "$DT_URL/api/v1/finding/project/$DT_PROJECT_UUID/export"
