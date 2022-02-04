#! /usr/bin/env bash

set -euo pipefail

kapp deploy -a grafana-agent-role \
-f clusterrole.yaml
