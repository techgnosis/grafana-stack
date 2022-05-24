#! /usr/bin/env bash

set -euo pipefail

kapp deploy -a grafana-enterprise \
-f namespace.yaml \
-f certificate.yml \
-f ldap.toml.yaml \
-f image-renderer.yaml \
-f telegraf.yaml \
-f mysql.yaml \
-f agent/clusterrolebinding.yaml \
-f agent/deployment.yaml \
-f agent/service.yaml \
-f agent/serviceaccount.yaml \
-f <(kubectl create cm license \
--namespace grafana-enterprise \
--from-file=license.jwt=../licenses/ge-license.jwt \
--dry-run=client \
-o yaml) \
-f <(kubectl create cm telegraf-config \
--namespace grafana-enterprise \
--from-file=telegraf.conf \
--dry-run=client \
-o yaml) \
-f <(kubectl create cm grafana-agent-config \
--namespace grafana-enterprise \
--from-file=agent/agent.yaml \
--dry-run=client \
-o yaml)


helm upgrade --install grafana-enterprise grafana \
--repo https://grafana.github.io/helm-charts \
--version 6.19.2 \
--namespace grafana-enterprise \
--values values.yaml \
--values grafana-ini.yml \
--wait