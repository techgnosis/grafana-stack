#! /usr/bin/env bash

set -euo pipefail

kapp deploy -a gel \
-f <(kubectl create secret generic ge-logs-license \
-n grafana-labs \
--from-file=license.jwt=../licenses/gel-license.jwt \
--dry-run=client \
-o yaml) \
-f cm.yml \
-f services.yml \
-f gel.yml \
-f tokengen.yml
