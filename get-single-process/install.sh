#! /usr/bin/env bash

set -euo pipefail

kapp deploy -a get \
-f namespace.yaml \
-f <(kubectl create secret generic get-license \
--namespace get \
--from-file ../licenses/get-license.jwt \
--dry-run=client \
-o yaml) \
-f <(kubectl create configmap get-config \
--namespace get \
--from-file config.yaml \
--dry-run=client \
-o yaml) \
-f get-service.yaml \
-f get-ss.yaml \
-f job.yaml \
-f minio.yaml \
-f certificate.yaml \
-f ingress.yaml \
-f compactor-ss.yaml \
-f compactor-service.yaml \
-f gateway-deployment.yaml \
-f gateway-service.yaml