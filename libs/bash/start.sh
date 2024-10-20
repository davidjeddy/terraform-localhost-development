#!/bin/bash

set -eo pipefail

# shellcheck disable=SC1091
source ./config.sh || exiti 1

# logic

## node

echo "INFO: Starting localhost NodeJS webserver ..."
node libs/conf/index.js

# shellcheck disable=SC1091
cd .tmp/citizen
NODE_EXTRA_CA_CERTS="" ./bin/citizen server --verbose
cd ../../
