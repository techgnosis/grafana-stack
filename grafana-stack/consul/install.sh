#! /usr/bin/env bash

set -euo pipefail

helm upgrade --install consul consul \
--repo https://helm.releases.hashicorp.com \
--version 0.32.0 \
--namespace grafana-labs \
--values consul-values.yml \
--wait