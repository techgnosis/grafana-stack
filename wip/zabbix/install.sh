#! /usr/bin/env bash

set -euo pipefail

kapp deploy -a zabbix \
-f cm.yml \
-f ingress.yml \
-f zabbix.yml \
-f namespace.yml \
-f postgres.yml \
-f certificate.yml