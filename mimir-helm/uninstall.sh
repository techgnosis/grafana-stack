#! /usr/bin/env bash

set -euo pipefail

helm uninstall mimir -n mimir --wait
kapp delete -a mimir -y