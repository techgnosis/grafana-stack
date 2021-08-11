#! /usr/bin/env bash

set -euo pipefail

kapp deploy -a grafana-enterprise \
-f certificate.yml \
-f grafana-ldap.yml \
-f datasources.yml \
-f <(k create cm license \
--namespace grafana-enterprise \
--from-file=license.jwt=../licenses/ge-license.jwt \
--dry-run=client \
-o yaml)

helm upgrade --install grafana-enterprise grafana \
--repo https://grafana.github.io/helm-charts \
--version 6.13.5 \
--namespace grafana-enterprise \
--values grafana-values.yml \
--wait