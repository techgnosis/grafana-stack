#! /usr/bin/env bash

set -euo pipefail

kapp deploy -a prometheus-cert \
-f certificate.yml

helm upgrade --install prometheus prometheus \
--repo https://prometheus-community.github.io/helm-charts \
--version 14.2.1 \
--namespace prometheus \
--values prometheus-values.yml \
--wait