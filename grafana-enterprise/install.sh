#! /usr/bin/env bash

set -euo pipefail

kapp deploy -a grafana-enterprise \
-f namespace.yaml \
-f certificate.yml \
-f postgres.yml \
-f image-renderer.yaml \
-f ge-ss.yaml \
-f ge-service.yaml \
-f ge-ingress.yaml \
-f prometheus.yaml \
-f <(kubectl create secret generic grafana-enterprise-license \
--namespace grafana-enterprise \
--from-file=license.jwt=../licenses/ge-license.jwt \
--dry-run=client \
-o yaml) \
-f <(kubectl create cm grafana-config \
--namespace grafana-enterprise \
--from-file=grafana.ini \
--dry-run=client \
-o yaml) \
-f <(kubectl create cm ldap-config \
--namespace grafana-enterprise \
--from-file=ldap.toml \
--dry-run=client \
-o yaml)