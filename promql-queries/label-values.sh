#! /usr/bin/env bash

set -euo pipefail

LABEL_NAME=$1

curl \
https://prometheus.lab.home/api/v1/label/$LABEL_NAME/values | jq