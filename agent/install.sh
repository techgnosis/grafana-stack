#! /usr/bin/env bash

set -euo pipefail

kapp deploy -a grafana-agent \
-f <(kubectl create secret generic gel-creds \
-n agent \
--from-literal=GEL_WRITE_URL=${GEL_WRITE_URL} \
--from-literal=GEL_WRITE_USERNAME=${GEL_WRITE_USERNAME} \
--from-literal=GEL_WRITE_PASSWORD=${GEL_WRITE_PASSWORD} \
--dry-run=client \
-o yaml) \
-f <(kubectl create secret generic gem-creds \
-n agent \
--from-literal=GEM_WRITE_URL=${GEM_WRITE_URL} \
--from-literal=GEM_WRITE_USERNAME=${GEM_WRITE_USERNAME} \
--from-literal=GEM_WRITE_PASSWORD=${GEM_WRITE_PASSWORD} \
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
