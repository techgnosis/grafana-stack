#! /usr/bin/env bash

set -euo pipefail

kapp deploy -a mimir \
-f namespace.yaml \
-f certificate.yaml \
-f ingress.yaml

helm upgrade --install mimir mimir-distributed \
--repo https://grafana.github.io/helm-charts \
--version 2.0.14 \
--namespace mimir \
--values values.yaml \
--set-file 'mimir.config=./mimir.yaml' \
--wait
