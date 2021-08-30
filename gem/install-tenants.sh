#! /usr/bin/env bash

set -euo pipefail

kapp deploy -a gem-minio-tenants \
-f tenants.yml