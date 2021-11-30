#! /usr/bin/env bash

set -euo pipefail

kapp deploy -a grafana-enterprise \
-f namespace.yaml \
-f certificate.yml \
-f grafana-ldap.yml \
-f postgres.yml \
-f image-renderer.yaml \
-f <(kubectl create cm license \
--namespace grafana-enterprise \
--from-file=license.jwt=../licenses/ge-license.jwt \
--dry-run=client \
-o yaml)

helm upgrade --install grafana-enterprise grafana \
--repo https://grafana.github.io/helm-charts \
--version 6.16.6 \
--namespace grafana-enterprise \
--values grafana-values.yml \
--values grafana-ini.yml \
--wait