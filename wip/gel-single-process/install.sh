#! /usr/bin/env bash

set -euo pipefail

kapp deploy -a gel \
-f <(kubectl create secret generic gel-license \
--namespace gel \
--from-file ../licenses/gel-license.jwt \
--dry-run=client \
-o yaml) \
-f <(kubectl create configmap gel-config \
--namespace gel \
--from-file config.yaml \
--dry-run=client \
-o yaml) \
-f gel-service.yaml \
-f gel-service-headless.yaml \
-f gel-ss.yaml \
-f memberlist-service.yaml \
-f job.yaml \
-f certificate.yaml \
-f ingress.yaml \
-f namespace.yaml