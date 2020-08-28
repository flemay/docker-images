#!/usr/bin/env sh
set -e
set -u

aws-shell --help
aws --version
sam --version
python3 --version
cfn-lint --version