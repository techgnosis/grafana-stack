#! /usr/bin/env bash

set -euo pipefail

kapp deploy -a alertmanager \
-f namespace.yaml \
-f certificate.yml \
-f deployment.yaml \
-f ingress.yml \
-f <(kubectl create cm alertmanager \
--namespace alertmanager \
--from-file=alertmanager.yaml \
--dry-run=client \
-o yaml) \
