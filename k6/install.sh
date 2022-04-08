#! /usr/bin/env bash

set -euo pipefail

kapp deploy -a k6 \
-f namespace.yaml \
-f job.yaml \
-f <(kubectl create configmap k6-hotrod \
--namespace k6 \
--from-file hotrod.js \
--dry-run=client \
-o yaml)
