#! /usr/bin/env bash

set -euo pipefail

# need Grafana ingress
# Prometheus will scrape app
# promtail will push logs to Loki internally

kapp deploy -a grafana-labs-env \
--into-ns grafana-labs \
-f namespace.yml \
-f certificate.yml

# grafana, promtheus, loki, promtail
helm upgrade --install grafana-stack loki-stack \
--repo https://grafana.github.io/helm-charts \
--version 2.4.1 \
--namespace grafana-labs \
--values grafana-helm-values.yml

# tempo
helm upgrade --install tempo tempo \
--repo https://grafana.github.io/helm-charts \
--version 0.7.1 \
--namespace grafana-labs

