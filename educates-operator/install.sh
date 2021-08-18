#! /usr/bin/env bash

set -euo pipefail

kapp deploy -a educates \
-f systemprofile.yml \
-f certificate.yml \
-f <(kubectl apply \
-k "github.com/eduk8s/eduk8s?ref=21.05.10.1" \
--dry-run=client \
-o yaml)
