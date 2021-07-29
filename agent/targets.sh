#! /usr/bin/env bash

set -euo pipefail

curl http://grafana-agent.lab.home/agent/api/v1/targets | jq