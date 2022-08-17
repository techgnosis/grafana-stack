#! /usr/bin/env bash

set -euo pipefail

kapp delete -a opentelemetry-demo

helm uninstall opentelemetry-demo -n opentelemetry-demo
