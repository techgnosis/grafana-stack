#! /usr/bin/env bash

set -euo pipefail

kapp deploy -a simple-webhook \
-f namespace.yaml \
-f deployment.yaml \
-f service.yaml