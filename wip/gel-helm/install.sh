#! /usr/bin/env bash

set -euo pipefail

kapp deploy -a gel \
-f certificate.yml \
-f ingress.yml \
-f namespace.yml

helm upgrade --install gel enterprise-logs \
--repo https://grafana.github.io/helm-charts \
--version 1.2.0 \
--namespace gel \
--values values.yml \
--values config.yml \
--set-file 'license.contents=../licenses/gel-license.jwt'