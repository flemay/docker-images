#!/usr/bin/env bash
set -e
set -u

echo "${DOCKER_PASSWORD}" | docker login --username "${DOCKER_USERNAME}" --password-stdin docker.io
docker push "${DOCKER_IMAGE}"
docker logout
