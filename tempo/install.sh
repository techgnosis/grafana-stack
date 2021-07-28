#! /usr/bin/env bash

set -euo pipefail

helm upgrade --install tempo tempo-distributed \
--repo https://grafana.github.io/helm-charts \
--version 0.9.13 \
--namespace tempo \
--values tempo-values.yml \
--wait
