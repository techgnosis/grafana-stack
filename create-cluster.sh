#! /usr/bin/env bash

set -euo pipefail

k3d cluster create grafana-labs \
--servers 1 \
--agents 2 \
--subnet 172.18.0.0/24
