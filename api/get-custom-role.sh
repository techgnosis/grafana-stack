#! /usr/bin/env bash

set -euo pipefail

curl -X GET \
-u admin:admin \
https://grafana.lab.home/api/access-control/roles/_n9BJux7k | jq
