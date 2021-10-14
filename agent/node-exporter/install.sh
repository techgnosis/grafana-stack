#! /usr/bin/env bash

set -euo pipefail

kapp deploy -a grafana-agent \
-f <(kubectl create secret generic gel-creds \
-n agent \
--dry-run=client \
-o yaml) \
-f <(kubectl create secret generic gem-creds \
-n agent \
--dry-run=client \
-o yaml) \
-f <(kubectl create secret generic tempo-creds \
-n agent \
--dry-run=client \
-o yaml) \
-f cm.yml \
-f ../ds.yml \
-f ../service.yml \
-f ../ingress.yml \
-f ../namespace.yaml
