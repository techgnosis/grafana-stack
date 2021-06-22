#! /usr/bin/env bash

set -euo pipefail

kapp deploy -a grafana-agent-traces \
-f <(kubectl create secret generic tempo-creds \
-n grafana-agent-traces \
--from-literal=TEMPO_ENDPOINT=${TEMPO_ENDPOINT} \
--dry-run=client \
-o yaml) \
-f cm.yml \
-f deployment.yml \
-f namespace.yml
