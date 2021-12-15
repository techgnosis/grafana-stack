#! /usr/bin/env bash

set -euo pipefail

kapp deploy -a hotrod \
-f ingress.yaml \
-f deployment.yaml \
-f namespace.yaml \
-f certificate.yaml \
-f service.yaml