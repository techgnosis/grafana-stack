#! /usr/bin/env bash

set -euo pipefail

helm upgrade --install enterprise-logs-test-fixture /home/james/code/helm-charts/charts/enterprise-logs \
--version 0.1.0 \
--namespace gel \
--set-file 'license.contents=../licenses/gel-license.jwt'