#! /usr/bin/env bash

set -euo pipefail

kapp deploy -a grafana-labs-namespace \
-f namespace.yml