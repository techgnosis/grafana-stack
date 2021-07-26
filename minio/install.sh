#! /usr/bin/env bash

set -euo pipefail

helm upgrade --install minio minio \
--repo https://helm.min.io \
--version 8.0.9 \
--namespace minio \
--create-namespace \
--values values.yml \
--wait