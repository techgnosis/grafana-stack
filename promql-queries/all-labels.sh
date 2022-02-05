#! /usr/bin/env bash

set -euo pipefail

curl \
https://prometheus.lab.home/api/v1/labels | jq