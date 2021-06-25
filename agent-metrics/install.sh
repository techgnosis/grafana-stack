#! /usr/bin/env bash

set -euo pipefail

kapp deploy -a grafana-agent-metrics \
-f <(kubectl create secret generic gem-creds \
-n grafana-agent-metrics \
--from-literal=GEM_URL=${GEM_URL} \
--from-literal=GEM_USERNAME=${GEM_USERNAME} \
--from-literal=GEM_PASSWORD=${GEM_PASSWORD} \
--dry-run=client \
-o yaml) \
-f cm.yml \
-f deployment.yml \
-f namespace.yml
