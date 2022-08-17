#! /usr/bin/env bash

set -euo pipefail

kapp deploy -a hotrod \
-f namespace.yaml \
-f hotrod/ingress.yaml \
-f hotrod/deployment.yaml \
-f hotrod/certificate.yaml \
-f hotrod/service.yaml \
-f agent/deployment.yaml \
-f agent/clusterrolebinding.yaml \
-f agent/service.yaml \
-f agent/serviceaccount.yaml \
-f <(kubectl create configmap grafana-agent-config \
--namespace hotrod \
--from-file agent/agent.yaml \
--dry-run=client \
-o yaml)