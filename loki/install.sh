#! /usr/bin/env bash

set -euo pipefail

helm upgrade --install loki loki-distributed \
--repo https://grafana.github.io/helm-charts \
--version 0.35.0 \
--namespace grafana-labs \
--values loki-values.yml \
--wait