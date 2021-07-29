#! /usr/bin/env bash

set -euo pipefail

helm upgrade --install gem enterprise-metrics \
--repo https://grafana.github.io/helm-charts \
--version 1.3.4 \
--namespace gem \
--values gem-values.yml \
--set-file 'license.contents=../licenses/gem-license.jwt' \
--values config.yml \
--wait