#! /usr/bin/env bash

set -euo pipefail

kapp deploy -a grafana-agent \
-f <(kubectl create secret generic gel-creds \
-n agent \
--from-literal=GEL_URL=${GEL_URL} \
--from-literal=GEL_USERNAME=${GEL_USERNAME} \
--from-literal=GEL_PASSWORD=${GEL_PASSWORD} \
--dry-run=client \
-o yaml) \
-f <(kubectl create secret generic gem-creds \
-n agent \
--from-literal=GEM_URL=${GEM_URL} \
--from-literal=GEM_USERNAME=${GEM_USERNAME} \
--from-literal=GEM_PASSWORD=${GEM_PASSWORD} \
--dry-run=client \
-o yaml) \
-f <(kubectl create secret generic tempo-creds \
-n agent \
--from-literal=TEMPO_ENDPOINT=${TEMPO_ENDPOINT} \
--dry-run=client \
-o yaml) \
-f cm.yml \
-f ds.yml \
-f service.yml \
-f ingress.yml
