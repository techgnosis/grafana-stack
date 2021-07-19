#! /usr/bin/env bash

set -euo pipefail

kapp deploy -a grafana-agent \
-f <(kubectl create secret generic loki-creds \
-n grafana-labs \
--from-literal=LOKI_HOSTNAME=${LOKI_HOSTNAME} \
--dry-run=client \
-o yaml) \
-f <(kubectl create secret generic gem-creds \
-n grafana-labs \
--from-literal=GEM_URL=${GEM_URL} \
--from-literal=GEM_USERNAME=${GEM_USERNAME} \
--from-literal=GEM_PASSWORD=${GEM_PASSWORD} \
--dry-run=client \
-o yaml) \
-f <(kubectl create secret generic tempo-creds \
-n grafana-labs \
--from-literal=TEMPO_ENDPOINT=${TEMPO_ENDPOINT} \
--dry-run=client \
-o yaml) \
-f cm.yml \
-f ds.yml \
-f service.yml
