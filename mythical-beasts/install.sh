#! /usr/bin/env bash

set -euo pipefail

kapp deploy -a mythical-beasts \
-f namespace.yaml \
-f deployment.yaml \
-f service.yaml \
-f postgres.yaml \
-f agent/deployment.yaml \
-f agent/clusterrolebinding.yaml \
-f agent/service.yaml \
-f agent/serviceaccount.yaml \
-f <(kubectl create configmap grafana-agent-config \
--namespace mythical-beasts \
--from-file agent/agent.yaml \
--dry-run=client \
-o yaml)
