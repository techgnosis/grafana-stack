#! /usr/bin/env bash

set -euo pipefail

kapp deploy -a loki \
-f namespace.yaml \
-f certificate.yaml \
-f ingress.yaml

helm upgrade --install loki loki-distributed \
--repo https://grafana.github.io/helm-charts \
--version 0.48.3 \
--namespace loki \
--values values.yaml \
--wait
