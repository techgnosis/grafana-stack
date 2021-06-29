#! /usr/bin/env bash

set -euo pipefail

kapp deploy \
-a tns \
--into-ns=tns \
-f namespace.yml \
-f app-dep.yml \
-f app-svc.yml \
-f db-dep.yml \
-f db-svc.yml \
-f loadgen-dep.yml \
-f certificate.yml \
-f ingress.yml