#! /usr/bin/env bash

set -euo pipefail

kapp deploy -a grafana-agent \
-f cm.yml \
-f namespace.yaml \
-f ds.yml \
-f service.yml \
-f ingress.yml
