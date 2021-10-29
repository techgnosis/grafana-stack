#! /usr/bin/env bash

set -euo pipefail

kapp deploy -a flog \
-f deployment.yaml \
-f namespace.yaml