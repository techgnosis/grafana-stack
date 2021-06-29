#! /usr/bin/env bash

set -euo pipefail

grafana-cli plugins install grafana-metrics-enterprise-app

grafana-cli plugins install grafana-enterprise-logs-app