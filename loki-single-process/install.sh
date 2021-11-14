#! /usr/bin/env bash

set -euo pipefail

kapp deploy -a loki \
-f <(kubectl create configmap loki-config \
--namespace loki \
--from-file config.yaml \
--dry-run=client \
-o yaml) \
-f loki-service.yaml \
-f loki-ss.yaml \
-f minio.yaml \
-f certificate.yaml \
-f ingress.yaml \
-f namespace.yaml