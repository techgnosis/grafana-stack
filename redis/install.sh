#! /usr/bin/env bash

set -euo pipefail

kapp deploy -a redis \
-f namespace.yaml \
-f certificate.yml \
-f deployment.yaml \
-f ingress.yml \
-f service.yaml