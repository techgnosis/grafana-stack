#! /usr/bin/env bash

set -euo pipefail

helm upgrade --install loki loki \
--repo https://grafana.github.io/helm-charts \
--version 2.5.3 \
--namespace loki \
--values loki-values.yml \
--wait