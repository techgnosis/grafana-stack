#! /usr/bin/env bash

set -euo pipefail

helm upgrade --install cortex cortex \
--repo https://cortexproject.github.io/cortex-helm-chart \
--version 0.5.0 \
--namespace grafana-labs \
--values cortex-values.yml \
--wait