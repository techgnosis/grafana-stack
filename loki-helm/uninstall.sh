#! /usr/bin/env bash

set -euo pipefail

helm uninstall loki -n loki --wait
kapp delete -a loki -y