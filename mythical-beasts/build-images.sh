#! /usr/bin/env bash

set -euo pipefail

docker build \
--build-arg SERVICE=mythical-beasts-requester \
-f mythical-beasts/docker/Dockerfile \
-t docker.io/techgnosis/mythical-beasts-requester:1 \
mythical-beasts/

docker push docker.io/techgnosis/mythical-beasts-requester:1

docker build \
--build-arg SERVICE=mythical-beasts-server \
-f mythical-beasts/docker/Dockerfile \
-t docker.io/techgnosis/mythical-beasts-server:1 \
mythical-beasts/

docker push docker.io/techgnosis/mythical-beasts-server:1