#! /usr/bin/env bash

set -euo pipefail

curl -X POST \
-u admin:admin \
-H "Content-Type: application/json" \
-d @annotation-no-time.json \
https://grafana.lab.home/api/annotations