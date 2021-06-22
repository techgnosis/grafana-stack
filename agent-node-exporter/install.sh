#! /usr/bin/env bash

set -euo pipefail

kapp deploy -a grafana-agent-node-exporter \
-f <(kubectl create secret generic grafana-cloud-prometheus-creds \
--from-literal=GRAFANA_USERNAME=${GRAFANA_USERNAME} \
--from-literal=GRAFANA_PASSWORD=${GRAFANA_PASSWORD} \
--from-literal=GRAFANA_PROMETHEUS_URL=${GRAFANA_PROMETHEUS_URL} \
--dry-run=client \
-o yaml) \
-f cm.yml \
-f ds.yml
