#! /usr/bin/env bash

set -euo pipefail

kapp deploy -a flog \
-f namespace.yaml \
-f deployment.yaml \
-f agent/clusterrolebinding.yaml \
-f agent/deployment.yaml \
-f agent/serviceaccount.yaml \
-f <(kubectl create configmap grafana-agent-config \
--namespace flog \
--from-file agent/agent.yaml \
--dry-run=client \
-o yaml)
