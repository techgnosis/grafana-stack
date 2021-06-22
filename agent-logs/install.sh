#! /usr/bin/env bash

set -euo pipefail

kapp deploy -a grafana-agent-loki \
-f <(kubectl create secret generic grafana-cloud-loki-creds \
--from-literal=LOKI_USERNAME=${LOKI_USERNAME} \
--from-literal=LOKI_PASSWORD=${LOKI_PASSWORD} \
--from-literal=LOKI_HOSTNAME=${LOKI_HOSTNAME} \
--dry-run=client \
-o yaml) \
-f cm.yml \
-f ds.yml
