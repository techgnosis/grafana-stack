#! /usr/bin/env bash

set -euo pipefail

# tempo
helm upgrade --install tempo tempo \
--repo https://grafana.github.io/helm-charts \
--version 0.7.3 \
--namespace grafana-labs \
--values tempo-values.yml \
--wait
