#! /usr/bin/env bash

set -euo pipefail

kapp deploy -a gem \
-f namespace.yaml \
-f certificate.yml \
-f ingress.yml

helm upgrade --install gem enterprise-metrics \
--repo https://grafana.github.io/helm-charts \
--version 1.7.1 \
--namespace gem \
--values values.yml \
--set-file 'license.contents=../licenses/gem-license.jwt' \
--values config.yml