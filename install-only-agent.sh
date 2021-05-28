#! /usr/bin/env bash

set -euo pipefail

# need Grafana ingress
# Prometheus will scrape app
# promtail will push logs to Loki internally

kapp deploy -a grafana-labs-env \
--into-ns grafana-labs \
-f namespace.yml

kapp deploy -a grafana-agent \
--into-ns grafana-labs \
-f agent-ds.yml \
-f agent-cm.yml