#! /usr/bin/env bash

set -euo pipefail

kapp deploy -a grafana-labs-env \
--into-ns grafana-labs \
-f namespace.yml \
-f certificate.yml

# grafana
helm upgrade --install grafana grafana \
--repo https://grafana.github.io/helm-charts \
--version 6.13.5 \
--namespace grafana-labs \
--values grafana-values.yml \
--wait

# prometheus
helm upgrade --install prometheus prometheus \
--repo https://prometheus-community.github.io/helm-charts \
--version 14.2.1 \
--namespace grafana-labs \
--values prometheus-values.yml \
--wait

# loki
helm upgrade --install loki loki \
--repo https://grafana.github.io/helm-charts \
--version 2.5.1 \
--namespace grafana-labs \
--values loki-values.yml \
--wait

# tempo
helm upgrade --install tempo tempo \
--repo https://grafana.github.io/helm-charts \
--version 0.7.3 \
--namespace grafana-labs \
--values tempo-values.yml \
--wait
