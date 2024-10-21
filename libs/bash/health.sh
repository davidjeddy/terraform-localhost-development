#!/bin/bash

set -eo pipefail

# shellcheck disable=SC1091
source ./libs/bash/config.sh || exiti 1

# Citizen
curl --location https://registry.localhost.com/citizen/health && printf "\n"
# Node
curl --location https://registry.localhost.com/node/health
# TLS
curl --location https://registry.localhost.com/tls/health
