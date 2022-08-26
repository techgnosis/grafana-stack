#! /usr/bin/env bash

set -euo pipefail

if [ -f metrics ]; then
    rm metrics
fi

ACTIVE_SERIES="${1}"

wget --quiet http://localhost:12345/metrics

BYTES=$(stat --format=%s metrics)

echo "BYTES FROM NODE_EXPORTER: ${BYTES}"

SERIES=$(cat metrics | awk '!/^#/' | wc -l)

echo "SERIES FROM NODE_EXPORTER: ${SERIES}"

BYTES_PER_SERIES=$((BYTES / SERIES))

echo "BYTES PER SERIES: ${BYTES_PER_SERIES}"

TOTAL_BYTES=$((ACTIVE_SERIES * BYTES_PER_SERIES * 60 * 24 * 31))

echo "TOTAL BYTES PER MONTH: ${TOTAL_BYTES}"

TOTAL_GIBS=$((TOTAL_BYTES / 1073741824))

echo "TOTAL GiBs per month: ${TOTAL_GIBS}"

