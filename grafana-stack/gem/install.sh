#! /usr/bin/env bash

set -euo pipefail

helm upgrade --install gem enterprise-metrics \
--repo https://grafana.github.io/helm-charts \
--version 1.3.4 \
--namespace grafana-labs \
--values gem-values.yml \
--set-file 'license.contents=./license.jwt' \
--wait