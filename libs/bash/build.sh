#!/bin/bash

set -eo pipefail

# shellcheck disable=SC1091
source "./config.sh" || exiti 1

## Citizen

cd .tmp/citizen || exit 1
    npm install
    npm run client
    npm run build
    npm run build:macos_x86
cd ../../ || exit 1

## mkcert  - https://github.com/FiloSottile/mkcert

echo "INFO: Create and Install localhost TLS certifcate..."
cd .tmp/ || exit 1
    mkcert -install
    mkcert localhost
cd ../ || exit 1

## Node

### nothing needed

## Check component versions

printf "INFO: citizen version is %s\n" "$(./.tmp/citizen/bin/citizen --version)"
printf "INFO: mkcert version is %s\n" "$(mkcert -version)"
printf "INFO: node version is %s\n" "$(node --version)"
