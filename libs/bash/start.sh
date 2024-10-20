#!/bin/bash

set -eo pipefail

# shellcheck disable=SC1091
source "./config.sh" || exiti 1

# logic

## node

echo "INFO: Starting localhost nodejs webserver ..."



# https://www.ssldragon.com/how-to/install-ssl-certificate/node-js/
node libs/conf/index.js | tee node.log

# TODO verify TLS cert is installed and good
# declare RESPONSE
# RESPONSE=$(
#     curl \
#     --verbose \
#     --show-error \
#     https://localhost
# )

# if [[ $RESPONSE != "localhost TLS certificate working as expected." ]]
# then
#     echo "ERR: Failed to validate localhost TLS certificate."
#     exit 1
# fi

# NODE_PID=$(sudo kill -5 $(ps aux | grep "node libs/conf/index.js" | awk '{ print $2 }'))

# citizen

echo "INFO: Configure IaC registry (Citizen) service ..."

./bin/citizen server --verbose | tee citizen_server.log

# citizen is running
curl --location --verbose http://localhost:3000/health
# node is running
curl --location --verbose https://localhost
# proxy is working
curl --location --verbose https://localhost/health
