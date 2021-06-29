#! /usr/bin/env bash

set -euo pipefail

kapp deploy -a gel \
-f <(kubectl create secret generic gem-license \
-n grafana-labs \
--from-file=../licenses/gem-license.jwt \
--dry-run=client \
-o yaml) \
-f cm.yml \
-f compactor-deployment.yml \
-f minio.yml \
-f services.yml \
-f statefulset.yml
