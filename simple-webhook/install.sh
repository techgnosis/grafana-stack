#! /usr/bin/env bash

set -euo pipefail

kapp deploy -a simple-webhook \
-f deployment.yaml \
-f service.yaml