#! /usr/bin/env bash

set -euo pipefail

kapp deploy -a minio \
-f minio.yml