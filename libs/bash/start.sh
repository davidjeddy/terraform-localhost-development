#!/bin/bash

set -eo pipefail

# shellcheck disable=SC1091
source "./config.sh" || exiti 1

# logic

## node

echo "INFO: Starting localhost NodeJS webserver ..."
node libs/conf/index.js

# shellcheck disable=SC1091
source "./libs/bash/config.sh" \
    && cd .tmp/citizen \
    && ./bin/citizen server --verbose

# Encryption
curl --location --verbose https://localhost/tls/health
# Node
curl --location --verbose https://localhost/node/health
# Citizen
curl --location --verbose https://localhost/citizen/health
