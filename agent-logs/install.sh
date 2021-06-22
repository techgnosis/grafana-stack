#! /usr/bin/env bash

set -euo pipefail

kapp deploy -a grafana-agent-logs \
-f <(kubectl create secret generic loki-creds \
-n grafana-agent-logs \
--from-literal=LOKI_HOSTNAME=${LOKI_HOSTNAME} \
--dry-run=client \
-o yaml) \
-f cm.yml \
-f ds.yml \
-f namespace.yml
