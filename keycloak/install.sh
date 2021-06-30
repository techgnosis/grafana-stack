#! /usr/bin/env bash

set -euo pipefail

kapp deploy -a keycloak \
-f cm.yml \
-f ingress.yml \
-f keycloak.yml \
-f namespace.yml \
-f postgres.yml \
-f certificate.yml