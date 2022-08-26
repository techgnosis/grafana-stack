#! /usr/bin/env bash

set -euo pipefail

if [ -f metrics ]; then
    rm metrics
fi

ACTIVE_SERIES="${1}"

echo "ESTABLISHING BASELINE NUMBERS"
echo "-----------------------------"

wget --quiet http://localhost:12345/metrics

BYTES=$(stat --format=%s metrics)

echo "BYTES FROM NODE_EXPORTER: ${BYTES}"

SERIES=$(cat metrics | awk '!/^#/' | wc -l)

echo "SERIES FROM NODE_EXPORTER: ${SERIES}"

BYTES_PER_SERIES=$((BYTES / SERIES))

echo "AVERAGE BYTES PER NODE_EXPORTER SERIES: ${BYTES_PER_SERIES}"



echo ""
echo "MATH FOR ${ACTIVE_SERIES} SERIES"
echo "----------------------------"

BYTES_PER_SCRAPE=$((ACTIVE_SERIES * BYTES_PER_SERIES))

echo "BYTES PER SCRAPE: ${BYTES_PER_SCRAPE}"

TOTAL_BYTES=$((BYTES_PER_SCRAPE * 60 * 24 * 31))

echo "TOTAL BYTES PER MONTH: ${TOTAL_BYTES}"

TOTAL_GIBS=$((TOTAL_BYTES / 1073741824))

echo "TOTAL GiBs PER MONTH: ${TOTAL_GIBS}"

