#! /usr/bin/env bash

set -euo pipefail

mc rm clusterminio/enterprise-metrics-admin --recursive --force
mc rm clusterminio/enterprise-metrics-tsdb --recursive --force
mc rm clusterminio/enterprise-metrics-ruler --recursive --force
mc rm clusterminio/enterprise-metrics-alertmanager --recursive --force