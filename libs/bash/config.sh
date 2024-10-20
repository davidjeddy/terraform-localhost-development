#!/bin/bash

set -eo pipefail

## ---

declare ARCH
ARCH="$(uname -p)"
if [[ $ARCH == "i386" ]]
then
    ARCH="amd64"
elif [[ $ARCH == "aarch" ]]
then
    ARCH="arm"
elif [[ $ARCH == "aarch64" ]]
then
    ARCH="arm64"
fi
export ARCH
printf "INFO: ARCH is %s\n" "$ARCH"

# -----

declare CITIZEN_ADDR
CITIZEN_ADDR="localhost"
export CITIZEN_ADDR
printf "INFO: CITIZEN_ADDR is %s\n" "$CITIZEN_ADDR"

declare CITIZEN_DATABASE_TYPE
CITIZEN_DATABASE_TYPE="sqlite"
export CITIZEN_DATABASE_TYPE
printf "INFO: CITIZEN_DATABASE_TYPE is %s\n" "$CITIZEN_DATABASE_TYPE"

declare CITIZEN_STORAGE_PATH
CITIZEN_STORAGE_PATH="./storage"
export CITIZEN_STORAGE_PATH
printf "INFO: CITIZEN_STORAGE_PATH is %s\n" "$CITIZEN_STORAGE_PATH"

declare CITIZEN_STORAGE
CITIZEN_STORAGE="file"
export CITIZEN_STORAGE
printf "INFO: CITIZEN_STORAGE is %s\n" "$CITIZEN_STORAGE"

# declare NODE_EXTRA_CA_CERTS
# NODE_EXTRA_CA_CERTS=".tmp/localhost.pem"
# TODO git sub-module citizen to use the following:
#NODE_EXTRA_CA_CERTS="$(git rev-parse --show-toplevel)/.tmp/localhost.pem"
# export NODE_EXTRA_CA_CERTS
# printf "INFO: NODE_EXTRA_CA_CERTS is %s\n" "$NODE_EXTRA_CA_CERTS"

declare NODE_ENV
NODE_ENV="development"
export NODE_ENV
printf "INFO: NODE_ENV is %s\n" "$NODE_ENV"

declare NODE_DEBUG
NODE_DEBUG="" #http,http-proxy,fs # only if needed
export NODE_DEBUG
printf "INFO: NODE_DEBUG is %s\n" "$NODE_DEBUG"

declare PLATFORM
PLATFORM="$(uname | awk '{print tolower($0)}')"
export PLATFORM
printf "INFO: PLATFORM is %s\n" "$PLATFORM"

# -----

if [[ ! -d ".tmp" ]]
then
    mkdir -p ".tmp/"
fi
