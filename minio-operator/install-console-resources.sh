#! /usr/bin/env bash

set -euo pipefail

kapp deploy -a minio-operator-resources \
-f certificate.yml \
-f console-ingress.yml