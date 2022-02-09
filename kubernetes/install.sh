#! /usr/bin/env bash

set -euo pipefail

kapp deploy -a cluster-monitoring \
-f namespace.yaml \
-f deployment.yaml \
-f clusterrolebinding.yaml \
-f serviceaccount.yaml \
-f <(kubectl create configmap grafana-agent-config \
--namespace cluster-monitoring \
--from-file agent.yaml \
--dry-run=client \
-o yaml)

helm upgrade --install ksm kube-state-metrics \
--repo https://prometheus-community.github.io/helm-charts \
--version 4.2.0 \
--namespace cluster-monitoring \
--wait \
--set image.tag=v2.2.0