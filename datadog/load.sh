#! /usr/bin/env bash

set -euo pipefail

#for i in {1..1}; do ...


CORES=1
for i in `seq 1 $CORES`; do cat /dev/zero > /dev/null