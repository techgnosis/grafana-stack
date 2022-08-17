#! /usr/bin/env bash

set -euo pipefail


helm upgrade --install opentelemetry-demo opentelemetry-demo \
--repo https://open-telemetry.github.io/opentelemetry-helm-charts \
--version 0.1.4 \
--namespace opentelemetry-demo \
--create-namespace \
--values values.yaml \
--wait

kapp deploy -a opentelemetry-demo \
-f ingress.yaml \
-f certificate.yaml
