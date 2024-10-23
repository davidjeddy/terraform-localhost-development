#!/bin/bash

set -eo pipefail

# shellcheck disable=SC1091
source ./libs/bash/config.sh || exiti 1

# Health checking endpoints
curl --location https://registry.localhost.com/citizen/health && printf "\n"
curl --location https://registry.localhost.com/node/health
curl --location https://registry.localhost.com/tls/health
