#!/bin/bash

set -eo pipefail

# shellcheck disable=SC1091
source ./config.sh || exiti 1

# Citizen
curl --location --verbose https://localhost/citizen/health
# Node
curl --location --verbose https://localhost/node/health
# TLS
curl --location --verbose https://localhost/tls/health
