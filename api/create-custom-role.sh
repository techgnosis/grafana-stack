#! /usr/bin/env bash

set -euo pipefail

curl -X POST \
-u admin:admin \
-H "Content-Type: application/json" \
-d @custom-role.json \
https://grafana.lab.home/api/access-control/roles
