#! /usr/bin/env bash

set -euo pipefail

kapp deploy -a grafana-enterprise \
-f certificate.yml \
-f grafana-ldap.yml \
-f datasources.yml \
-f postgres.yml \
-f <(kubectl create cm license \
--namespace grafana-enterprise \
--from-file=license.jwt=../licenses/ge-license.jwt \
--dry-run=client \
-o yaml) \
-f <(kubectl create secret generic datasource-creds \
-n grafana-enterprise \
--from-literal=GEM_URL_GRAFANA=${GEM_URL_GRAFANA} \
--from-literal=GEM_USERNAME_GRAFANA=${GEM_USERNAME_GRAFANA} \
--from-literal=GEM_PASSWORD_GRAFANA=${GEM_PASSWORD_GRAFANA} \
--from-literal=GEL_URL_GRAFANA=${GEL_URL_GRAFANA} \
--from-literal=GEL_USERNAME_GRAFANA=${GEL_USERNAME_GRAFANA} \
--from-literal=GEL_PASSWORD_GRAFANA=${GEL_PASSWORD_GRAFANA} \
--dry-run=client \
-o yaml)

helm upgrade --install grafana-enterprise grafana \
--repo https://grafana.github.io/helm-charts \
--version 6.16.4 \
--namespace grafana-enterprise \
--values grafana-values.yml \
--values grafana-ini.yml \
--wait