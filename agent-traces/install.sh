#! /usr/bin/env bash

set -euo pipefail

kapp deploy -a grafana-agent-tempo \
-f <(kubectl create secret generic grafana-cloud-tempo-creds \
--from-literal=TEMPO_USERNAME=${TEMPO_USERNAME} \
--from-literal=TEMPO_PASSWORD=${TEMPO_PASSWORD} \
--from-literal=TEMPO_ENDPOINT=${TEMPO_ENDPOINT} \
--dry-run=client \
-o yaml) \
-f cm.yml \
-f ds.yml
