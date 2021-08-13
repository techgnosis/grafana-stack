#! /usr/bin/env bash

set -euo pipefail

kapp deploy -a openldap \
-f openldap-dep.yaml \
-f openldap-service.yaml \
-f admin-certificate.yaml \
-f admin-dep.yaml \
-f admin-service.yaml \
-f admin-ingress.yaml