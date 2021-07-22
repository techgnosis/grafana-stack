#! /usr/bin/env bash

set -euo pipefail

kapp deploy -a grafana-oss-env \
-f certificate.yml

helm upgrade --install grafana-oss grafana \
--repo https://grafana.github.io/helm-charts \
--version 6.13.5 \
--namespace grafana-labs \
--values grafana-values.yml \
--wait