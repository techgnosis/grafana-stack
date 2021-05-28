#! /usr/bin/env bash

set -euo pipefail

k3d cluster create grafana-labs \
--servers 1 \
--agents 2 \
--network grafana-labs
