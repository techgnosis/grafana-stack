#! /usr/bin/env bash

set -euo pipefail

kapp deploy -a prometheus \
-f namespace.yaml \
-f certificate.yml \
-f prometheus.yaml \
-f ingress.yml