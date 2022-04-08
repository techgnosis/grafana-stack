#! /usr/bin/env bash

set -euo pipefail

helm uninstall gem -n gem --wait

kapp delete -a gem