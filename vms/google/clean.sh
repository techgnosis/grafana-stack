#! /usr/bin/env bash

set -euo pipefail

rm .terraform.lock.hcl
rm terraform.tfstate
rm terraform.tfstate.backup
rm -rf .terraform

terraform init