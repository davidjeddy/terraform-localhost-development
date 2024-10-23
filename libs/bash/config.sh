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
CITIZEN_ADDR="registry.localhost.com"
export CITIZEN_ADDR
printf "INFO: CITIZEN_ADDR is %s\n" "$CITIZEN_ADDR"

declare CITIZEN_DATABASE_TYPE
CITIZEN_DATABASE_TYPE="sqlite"
export CITIZEN_DATABASE_TYPE
printf "INFO: CITIZEN_DATABASE_TYPE is %s\n" "$CITIZEN_DATABASE_TYPE"

declare CITIZEN_STORAGE
CITIZEN_STORAGE="file"
export CITIZEN_STORAGE
printf "INFO: CITIZEN_STORAGE is %s\n" "$CITIZEN_STORAGE"

declare CITIZEN_STORAGE_PATH
CITIZEN_STORAGE_PATH="$(pwd)/.tmp"
export CITIZEN_STORAGE_PATH
printf "INFO: CITIZEN_STORAGE_PATH is %s\n" "$CITIZEN_STORAGE_PATH"

declare CITIZEN_DATABASE_URL
CITIZEN_DATABASE_URL="file:./citizen.db"
export CITIZEN_DATABASE_URL
printf "INFO: CITIZEN_DATABASE_URL is %s\n" "$CITIZEN_DATABASE_URL"

declare DEBUG
DEBUG="citizen:*"
export DEBUG
printf "INFO: DEBUG is %s\n" "$DEBUG"

declare NODE_ENV
NODE_ENV="development"
export NODE_ENV
printf "INFO: NODE_ENV is %s\n" "$NODE_ENV"

declare NODE_DEBUG
# only if needed
NODE_DEBUG="http,http-proxy,fs"
# NODE_DEBUG="" 
export NODE_DEBUG
printf "INFO: NODE_DEBUG is %s\n" "$NODE_DEBUG"

declare PLATFORM
PLATFORM="$(uname | awk '{print tolower($0)}')"
export PLATFORM
printf "INFO: PLATFORM is %s\n" "$PLATFORM"

declare VERBOSE_DB_LOG
VERBOSE_DB_LOG="TRACE"
export VERBOSE_DB_LOG
printf "INFO: VERBOSE_DB_LOG is %s\n" "$VERBOSE_DB_LOG"

# -----

if [[ ! -d ".tmp" ]]
then
    mkdir -p ".tmp/"
fi

# -----

if [[ $(cat /etc/hosts) != *"$CITIZEN_ADDR"* ]]
then
    printf "INFO: Adding record to /etc/hosts\n"
    sudo echo "127.0.0.1    $CITIZEN_ADDR" | sudo tee -a /etc/hosts > /dev/null
    tail /etc/hosts
fi
