#! /usr/bin/env bash

set -euo pipefail

helm upgrade --install ksm kube-state-metrics \
--repo https://prometheus-community.github.io/helm-charts \
--version 4.2.0 \
--namespace default \
--wait \
--set image.tag=v2.2.0

