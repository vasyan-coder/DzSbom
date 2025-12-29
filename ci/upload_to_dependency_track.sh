
#!/usr/bin/env bash
set -euo pipefail

BOM_PATH="${1:?Usage: $0 <path-to-bom.json>}"

: "${DT_URL:?DT_URL is required (e.g. http://host:8081)}"
: "${DT_API_KEY:?DT_API_KEY is required}"
: "${DT_PROJECT_UUID:?DT_PROJECT_UUID is required}"

curl -sS -f -X POST "$DT_URL/api/v1/bom" \
  -H "X-Api-Key: $DT_API_KEY" \
  -F "project=$DT_PROJECT_UUID" \
  -F "bom=@${BOM_PATH}"
