#! /usr/bin/env bash

set -euo pipefail

docker build -t gem-amazon:1 --file GEM-AmazonLinux .