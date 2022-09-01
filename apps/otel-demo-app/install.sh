#! /usr/bin/env bash

set -euo pipefail

kapp deploy -a opentelemetry-demo \
--namespace opentelemetry-demo \
--into-ns opentelemetry-demo \
-f namespace.yaml \
-f full-manifest.yaml \
-f ingress.yaml \
-f certificate.yaml \
-f agent/deployment.yaml \
-f agent/clusterrolebinding.yaml \
-f agent/service.yaml \
-f agent/serviceaccount.yaml \
-f <(kubectl create configmap grafana-agent-config \
--namespace hotrod \
--from-file agent/agent.yaml \
--dry-run=client \
-o yaml)
