#! /usr/bin/env bash

set -euo pipefail

# grafana
helm upgrade --install grafana grafana \
--repo https://grafana.github.io/helm-charts \
--version 6.13.5 \
--namespace grafana-labs \
--values grafana-values.yml \
--wait