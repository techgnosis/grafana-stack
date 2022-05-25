#! /usr/bin/env bash

set -euo pipefail

mc rm clusterminio/loki-data --recursive --force
mc rm clusterminio/loki-ruler --recursive --force
