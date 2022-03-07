#! /usr/bin/env bash

set -euo pipefail

helm uninstall gel -n gel
kapp delete -a gel -y