#! /usr/bin/env bash

set -euo pipefail

helm uninstall grafana-enterprise -n grafana-enterprise
kapp delete -a grafana-enterprise -y