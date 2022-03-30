#! /usr/bin/env bash

set -euo pipefail

kapp deploy -a mimir \
-f namespace.yaml \
-f certificate.yml \
-f statefulset.yaml \
-f services.yaml \
-f pvc.yaml \
-f ingress.yml  \
-f <(kubectl create configmap mimir-config \
--namespace mimir \
--from-file=mimir.yaml=./mimir.yaml \
--dry-run=client \
-o yaml) \
-f agent/clusterrolebinding.yaml \
-f agent/deployment.yaml \
-f agent/service.yaml \
-f agent/serviceaccount.yaml \
-f <(kubectl create configmap grafana-agent-config \
--namespace mimir \
--from-file=agent/agent.yaml \
--dry-run=client \
-o yaml)
