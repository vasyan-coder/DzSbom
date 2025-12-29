#!/usr/bin/env sh
set -eu

: "${DEPENDENCY_TRACK_URL:?Need DEPENDENCY_TRACK_URL}"
: "${DEPENDENCY_TRACK_API_KEY:?Need DEPENDENCY_TRACK_API_KEY}"

# Option A: upload to an existing project
# : "${DEPENDENCY_TRACK_PROJECT_UUID:?Need DEPENDENCY_TRACK_PROJECT_UUID}"

SBOM_FILE="${1:-artifacts/sbom.cdx.json}"

# Option B (recommended for CI): autoCreate a project by name+version
PROJECT_NAME="${DEPENDENCY_TRACK_PROJECT_NAME:-sbom-python-demo}"
PROJECT_VERSION="${DEPENDENCY_TRACK_PROJECT_VERSION:-0.1.0}"

curl -sS -X POST "${DEPENDENCY_TRACK_URL%/}/api/v1/bom" \
  -H "X-Api-Key: ${DEPENDENCY_TRACK_API_KEY}" \
  -F "autoCreate=true" \
  -F "projectName=${PROJECT_NAME}" \
  -F "projectVersion=${PROJECT_VERSION}" \
  -F "bom=@${SBOM_FILE}"

echo "Uploaded SBOM to Dependency-Track: ${PROJECT_NAME}@${PROJECT_VERSION}"
