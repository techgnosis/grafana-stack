#! /usr/bin/env bash

set -euo pipefail

kapp deploy -a grafana-labs-env \
--into-ns grafana-labs \
-f namespace.yml \
-f certificate.yml \
-f tempo-query-ingress.yml