#! /usr/bin/env bash

set -euo pipefail

helm upgrade --install oncall oncall \
--repo https://grafana.github.io/helm-charts \
--values values.yaml \
--namespace oncall \
--create-namespace

