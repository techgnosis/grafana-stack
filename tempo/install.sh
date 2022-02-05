#! /usr/bin/env bash

set -euo pipefail

kapp deploy -a tempo \
-f namespace.yaml \
-f certificate.yml \
-f statefulset.yaml \
-f services.yaml \
-f pvc.yaml \
-f ingress.yml  \
-f <(kubectl create configmap tempo-config \
--namespace tempo \
--from-file=tempo.yaml \
--dry-run=client \
-o yaml)