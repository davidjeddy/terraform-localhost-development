#!/bin/bash

set -eo pipefail

# shellcheck disable=SC1091
source ./libs/bash/config.sh || exiti 1

## Citizen

cd citizen || exit 1
    npm install
    npm run client:sqlite
    npm run build:macos_x86
cd ../ || exit 1

## mkcert  - https://github.com/FiloSottile/mkcert

echo "INFO: Create and Install TLS certifcate..."
cd .tmp/ || exit 1
    mkcert "$CITIZEN_ADDR"
    mkcert -install
cd ../ || exit 1

## Node

### nothing needed

## Check component versions

printf "INFO: citizen version is %s\n" "$(./citizen/bin/citizen --version)"
printf "INFO: mkcert version is %s\n" "$(mkcert -version)"
printf "INFO: node version is %s\n" "$(node --version)"
