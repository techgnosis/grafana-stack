#! /usr/bin/env bash

set -euo pipefail

kapp deploy -a alertmanager \
-f namespace.yaml \
-f certificate.yml \
-f alertmanager.yaml \
-f ingress.yml