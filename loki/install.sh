#! /usr/bin/env bash

set -euo pipefail

kapp deploy -a loki \
-f namespace.yaml \
-f certificate.yml \
-f statefulset.yaml \
-f services.yaml \
-f pvc.yaml \
-f ingress.yml  \
-f agent/clusterrolebinding.yaml \
-f agent/deployment.yaml \
-f agent/service.yaml \
-f agent/serviceaccount.yaml \
-f <(kubectl create configmap grafana-agent-config \
--namespace loki \
--from-file=agent/agent.yaml \
--dry-run=client \
-o yaml) \
-f <(kubectl create configmap loki-config \
--namespace loki \
--from-file=loki.yaml=./loki.yaml \
--dry-run=client \
-o yaml)