#! /usr/bin/env bash

set -euo pipefail

kapp deploy -a minio-ingress \
-f certificate.yml \
-f ingress.yml