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
-f memberlist-service.yaml \
-f job.yaml \
-f certificate.yaml \
-f ingress.yaml \
-f compactor-ss.yaml \
-f compactor-service.yaml \
-f compactor-service-headless.yaml \
-f gateway-deployment.yaml \
-f gateway-service.yaml \
-f alertmanager-service.yaml \
-f alertmanager-service-headless.yaml \
-f alertmanager-ss.yaml