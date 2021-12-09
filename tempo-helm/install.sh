#! /usr/bin/env bash

set -euo pipefail

helm upgrade --install tempo tempo \
--repo https://grafana.github.io/helm-charts \
--version 0.12.1 \
--namespace tempo \
--create-namespace \
--values tempo-values.yml \
--wait
