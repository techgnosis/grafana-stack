#! /usr/bin/env bash

set -euo pipefail

/home/james/bin/benchtool \
-bench.instance-name "benchtool" \
-bench.write.basic-auth-username "benchtool" \
-bench.write.basic-auth-password "YmVuY2h0b29sLWFsbC1mb3JldmVyOjdfIjI4PHs4djI1P2s0QTc/ezJjPSIjOQ==" \
-log.level debug \
-bench.write.enabled \
-bench.write.endpoint gem.lab.home