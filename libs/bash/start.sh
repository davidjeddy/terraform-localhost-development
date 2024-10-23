#!/bin/bash

set -eo pipefail

# shellcheck disable=SC1091
source ./libs/bash/config.sh || exiti 1

# logic

## node

echo "INFO: Starting NodeJS https server ..."
NODE_EXTRA_CA_CERTS=".tmp/$CITIZEN_ADDR-key.pem" node ./libs/conf/index.js

echo "INFO: Starting Citizen IaC registry ..."
# shellcheck disable=SC1091
./citizen/bin/citizen server --verbose
