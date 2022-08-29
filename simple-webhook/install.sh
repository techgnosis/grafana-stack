#! /usr/bin/env bash

set -euo pipefail

kapp deploy -a simple-webhook \
-f namespace.yml \
-f deployment.yml \
-f service.yml
