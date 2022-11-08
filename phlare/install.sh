#! /usr/bin/env bash

set -euo pipefail

kapp deploy -a phlare \
-f namespace.yaml \
-f certificate.yml \
-f statefulset.yaml \
-f services.yaml \
-f pvc.yaml \
-f ingress.yml  \
-f <(kubectl create configmap phlare-config \
--namespace phlare \
--from-file=phlare.yaml=./phlare.yaml \
--dry-run=client \
-o yaml) \
#-f agent/clusterrolebinding.yaml \
#-f agent/deployment.yaml \
#-f agent/service.yaml \
#-f agent/serviceaccount.yaml \
#-f <(kubectl create configmap grafana-agent-config \
#--namespace phlare \
#--from-file=agent/agent.yaml \
#--dry-run=client \
#-o yaml)
