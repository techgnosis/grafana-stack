#! /usr/bin/env bash

set -euo pipefail

kapp deploy -a grafana-enterprise-env \
-f certificate.yml \
-f grafana-ldap.yml

helm upgrade --install grafana-enterprise grafana \
--repo https://grafana.github.io/helm-charts \
--version 6.13.5 \
--namespace grafana-labs \
--values grafana-values.yml \
--wait