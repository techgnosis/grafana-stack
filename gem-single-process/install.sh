#! /usr/bin/env bash

set -euo pipefail

kapp deploy -a gem \
-f namespace.yaml \
-f <(kubectl create secret generic gem-license \
--namespace gem \
--from-file ../licenses/gem-license.jwt \
--dry-run=client \
-o yaml) \
-f <(kubectl create configmap gem-config \
--namespace gem \
--from-file config.yaml \
--dry-run=client \
-o yaml) \
-f gem-service.yaml \
-f gem-service-headless.yaml \
-f gem-ss.yaml \
-f tokengen-job.yaml \
-f certificate.yaml \
-f ingress.yaml