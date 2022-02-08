#! /usr/bin/env bash

set -euo pipefail

k6 run \
--vus 1 \
--duration 10h \
--batch 50 \
--min-iteration-duration 1s \
hotrod.js