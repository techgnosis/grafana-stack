#! /usr/bin/env bash

set -euo pipefail

curl -X PUT \
-u admin:admin \
-H "Content-Type: application/json" \
-d @custom-role.json \
https://grafana.lab.home/api/access-control/roles/_n9BJux7k | jq
