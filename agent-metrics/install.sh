#! /usr/bin/env bash

set -euo pipefail

kapp deploy -a grafana-agent-prometheus \
-f <(kubectl create secret generic grafana-cloud-prometheus-creds \
--from-literal=PROMETHEUS_USERNAME=${PROMETHEUS_USERNAME} \
--from-literal=PROMETHEUS_PASSWORD=${PROMETHEUS_PASSWORD} \
--from-literal=PROMETHEUS_URL=${PROMETHEUS_URL} \
--dry-run=client \
-o yaml) \
-f cm.yml \
-f ds.yml
