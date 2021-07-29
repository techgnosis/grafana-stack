#! /usr/bin/env bash

set -euo pipefail

helm upgrade --install gel /home/james/code/helm-charts/charts/enterprise-logs \
--version 1.1.0 \
--namespace grafana-labs \
--values gel-values.yml \
--set-file 'license.contents=../licenses/gel-license.jwt' \
--wait