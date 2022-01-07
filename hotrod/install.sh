#! /usr/bin/env bash

set -euo pipefail

kapp deploy -a hotrod \
-f ingress.yaml \
-f deployment.yaml \
-f namespace.yaml \
-f certificate.yaml \
-f service.yaml \
-f agent-deployment.yaml \
-f <(kubectl create configmap grafana-agent-config \
--namespace hotrod \
--from-file agent.yaml \
--dry-run=client \
-o yaml)