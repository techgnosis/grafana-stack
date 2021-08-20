#! /usr/bin/env bash

set -euo pipefail

kapp deploy -a grafana-enterprise \
-f certificate.yml \
-f grafana-ldap.yml \
-f datasources.yml \
-f <(kubectl create cm license \
--namespace grafana-enterprise \
--from-file=license.jwt=../licenses/ge-license.jwt \
--dry-run=client \
-o yaml) \
-f <(kubectl create secret generic datasource-creds \
-n grafana-enterprise \
--from-literal=GEM_READ_URL=${GEM_READ_URL} \
--from-literal=GEM_READ_USERNAME=${GEM_READ_USERNAME} \
--from-literal=GEM_READ_PASSWORD=${GEM_READ_PASSWORD} \
--from-literal=GEL_READ_URL=${GEL_READ_URL} \
--from-literal=GEL_READ_USERNAME=${GEL_READ_USERNAME} \
--from-literal=GEL_READ_PASSWORD=${GEL_READ_PASSWORD} \
--dry-run=client \
-o yaml)

helm upgrade --install grafana-enterprise grafana \
--repo https://grafana.github.io/helm-charts \
--version 6.13.5 \
--namespace grafana-enterprise \
--values grafana-values.yml \
--wait