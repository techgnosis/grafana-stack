#! /usr/bin/env bash

set -euo pipefail

rm -rf \
.terraform \
.terraform.lock.hcl \
terraform.tfstate \
terraform.tfstate.backup

terraform init