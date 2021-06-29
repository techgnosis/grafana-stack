#! /usr/bin/env bash

set -euo pipefail

kapp deploy -a grafana-labs-namespace \
--into-ns grafana-labs \
-f namespace.yml