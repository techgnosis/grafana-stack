#! /usr/bin/env bash

set -euo pipefail

kapp deploy -a gem \
-f namespace.yaml \
-f certificate.yml \
-f ingress.yml \
-f <(kubectl create configmap mimir-config \
--namespace gem \
--from-file=./mimir.yaml \
--dry-run=client \
-o yaml)


helm upgrade --install --debug gem mimir-distributed \
--repo https://grafana.github.io/helm-charts \
--version 4.0.0-weekly.210 \
--namespace gem \
--values values.yml \
--set-file 'license.contents=../licenses/gem-license.jwt'
