#! /usr/bin/env bash

set -euo pipefail

helm upgrade --install agent-operator grafana-agent-operator \
--repo https://grafana.github.io/helm-charts \
--version 0.1.5 \
--create-namespace \
--namespace agent-operator