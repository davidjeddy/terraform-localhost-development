#!/bin/bash

set -eo pipefail

# shellcheck disable=SC1091
source ./libs/bash/config.sh || exiti 1

# logic

## node

echo "INFO: Starting localhost NodeJS https server ..."
node libs/conf/index.js

echo "INFO: Starting localhost Citizen IaC registry ..."
# shellcheck disable=SC1091
cd citizen
    NODE_EXTRA_CA_CERTS="" ./bin/citizen server --verbose
cd ../
