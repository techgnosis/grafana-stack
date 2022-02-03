#! /usr/bin/env bash

set -euo pipefail

mc rm clusterminio/enterprise-traces-admin --recursive --force
mc rm clusterminio/enterprise-traces-data --recursive --force