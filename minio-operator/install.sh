#! /usr/bin/env bash

set -euo pipefail

helm upgrade --install minio-operator minio-operator \
--repo https://operator.min.io/ \
--version 4.1.8 \
--namespace minio-operator \
--values values.yml