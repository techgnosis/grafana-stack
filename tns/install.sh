#! /usr/bin/env bash

set -euo pipefail

kapp deploy \
-a tns \
-f app-dep.yml \
-f app-svc.yml \
-f db-dep.yml \
-f db-svc.yml \
-f loadgen-dep.yml \
-f loadgen-svc.yml \
-f certificate.yml \
-f ingress.yml