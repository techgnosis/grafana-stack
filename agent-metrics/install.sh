#! /usr/bin/env bash

set -euo pipefail

kapp deploy -a grafana-agent-metrics \
-f <(kubectl create secret generic prometheus-creds \
-n grafana-agent-metrics \
--from-literal=PROMETHEUS_URL=${PROMETHEUS_URL} \
--dry-run=client \
-o yaml) \
-f cm.yml \
-f ds.yml \
-f namespace.yml
