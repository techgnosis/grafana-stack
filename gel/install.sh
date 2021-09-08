#! /usr/bin/env bash

set -euo pipefail

kapp deploy -a gel \
-f certificate.yml \
-f ingress.yml

helm upgrade --install enterprise-logs-test-fixture /home/james/code/helm-charts/charts/enterprise-logs \
--version 1.0.0 \
--namespace gel \
--values values.yml \
--set-file 'license.contents=../licenses/gel-license.jwt'