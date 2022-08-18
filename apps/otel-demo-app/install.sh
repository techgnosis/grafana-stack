#! /usr/bin/env bash

set -euo pipefail

kapp deploy -a opentelemetry-demo \
--namespace opentelemetry-demo \
--into-ns opentelemetry-demo \
-f namespace.yaml \
-f full-manifest.yaml \
-f ingress.yaml \
-f certificate.yaml
