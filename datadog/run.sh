#! /usr/bin/env bash

docker run \
--rm \
--name dd-agent \
-v /var/run/docker.sock:/var/run/docker.sock:ro \
-v /proc/:/host/proc/:ro \
-v /sys/fs/cgroup/:/host/sys/fs/cgroup:ro \
-e DD_API_KEY \
-e DD_SITE="datadoghq.com" \
-e DD_ADDITIONAL_ENDPOINTS \
gcr.io/datadoghq/agent:7
