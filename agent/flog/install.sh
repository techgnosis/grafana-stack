#! /usr/bin/env bash

set -euo pipefail

kapp deploy -a grafana-agent \
-f <(kubectl create secret generic gel-creds \
-n agent \
--from-literal=GEL_URL_AGENT=${GEL_URL_AGENT} \
--from-literal=GEL_USERNAME_AGENT=${GEL_USERNAME_AGENT} \
--from-literal=GEL_PASSWORD_AGENT=${GEL_PASSWORD_AGENT} \
--dry-run=client \
-o yaml) \
-f <(kubectl create secret generic gem-creds \
-n agent \
--from-literal=GEM_URL_AGENT=${GEM_URL_AGENT} \
--from-literal=GEM_USERNAME_AGENT=${GEM_USERNAME_AGENT} \
--from-literal=GEM_PASSWORD_AGENT=${GEM_PASSWORD_AGENT} \
--dry-run=client \
-o yaml) \
-f <(kubectl create secret generic tempo-creds \
-n agent \
--from-literal=TEMPO_ENDPOINT=${TEMPO_ENDPOINT} \
--dry-run=client \
-o yaml) \
-f cm.yml \
-f ../ds.yml \
-f ../service.yml \
-f ../ingress.yml
