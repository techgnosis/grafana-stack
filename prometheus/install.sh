#! /usr/bin/env bash

set -euo pipefail

kapp deploy -a prometheus-env \
-f certificate.yml

helm upgrade --install prometheus prometheus \
--repo https://prometheus-community.github.io/helm-charts \
--version 14.2.1 \
--namespace grafana-labs \
--values prometheus-values.yml \
--wait