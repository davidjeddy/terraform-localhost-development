#!/bin/bash

set -eo pipefail

# shellcheck disable=SC1091
source "./config.sh" || exiti 1

## mkcert  - https://github.com/FiloSottile/mkcert

echo "INFO: Create and Install localhost TLS certifcate..."
cd .tmp/ || exit 1
mkcert -install
mkcert localhost
cd ../ || exit 1

## Citizen

cd .tmp/citizen || exit 1

npm install
npm run client

if [[ $PLATFORM == "darwin" ]]
then
    npm run build:macos --verbose
fi

cd ../../ || exit 1
