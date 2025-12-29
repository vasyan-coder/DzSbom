#!/usr/bin/env sh
set -eu

: "${DEPENDENCY_TRACK_URL:?Need DEPENDENCY_TRACK_URL}"
: "${DEPENDENCY_TRACK_API_KEY:?Need DEPENDENCY_TRACK_API_KEY}"
: "${DEPENDENCY_TRACK_PROJECT_UUID:?Need DEPENDENCY_TRACK_PROJECT_UUID}"

OUT_FILE="${1:-artifacts/dependency-track-findings.fpf.json}"

curl -sS -X GET "${DEPENDENCY_TRACK_URL%/}/api/v1/finding/project/${DEPENDENCY_TRACK_PROJECT_UUID}/export" \
  -H "X-Api-Key: ${DEPENDENCY_TRACK_API_KEY}" \
  -H "Accept: application/json" \
  -o "${OUT_FILE}"

echo "Exported Dependency-Track findings to ${OUT_FILE}"
