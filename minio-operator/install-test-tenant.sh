#! /usr/bin/env bash

set -euo pipefail

kapp deploy -a minio-test-tenant \
-f tenant.yml