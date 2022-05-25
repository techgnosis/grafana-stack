#! /usr/bin/env bash

set -euo pipefail

curl -X GET \
-u admin:admin \
https://grafana.lab.home/api/folders