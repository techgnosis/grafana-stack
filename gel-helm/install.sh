#! /usr/bin/env bash

set -euo pipefail

helm upgrade --install gel /home/james/code/helm-charts/charts/enterprise-logs \
--version 0.1.0 \
--namespace gel \
--wait \
--values gel-values.yml \
--set-file 'license.contents=../licenses/gel-license.jwt'