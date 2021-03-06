#! /usr/bin/env bash

set -euo pipefail

kapp deploy -a get \
-f <(kubectl create secret generic get-license \
--namespace get \
--from-file ../licenses/get-license.jwt \
--dry-run=client \
-o yaml) \
-f <(kubectl create configmap get-config \
--namespace get \
--from-file=config.yaml=config.yaml \
--dry-run=client \
-o yaml) \
-f get-service.yaml \
-f get-service-headless.yaml \
-f get-ss.yaml \
-f memberlist-service.yaml \
-f job.yaml \
-f certificate.yaml \
-f ingress.yaml \
-f namespace.yaml