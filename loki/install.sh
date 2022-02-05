#! /usr/bin/env bash

set -euo pipefail

kapp deploy -a loki \
-f namespace.yaml \
-f certificate.yml \
-f statefulset.yaml \
-f services.yaml \
-f pvc.yaml \
-f ingress.yml  \
-f <(kubectl create configmap loki-config \
--namespace loki \
--from-file=loki.yaml \
--dry-run=client \
-o yaml)