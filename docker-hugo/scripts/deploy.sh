#!/usr/bin/env sh
set -e
set -u

curl -X POST ${DOCKERHUB_TRIGGER_URL}
echo " TRIGGERED Docker Autobuild"
