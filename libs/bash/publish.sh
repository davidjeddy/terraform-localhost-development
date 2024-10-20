#!/bin/bash

set -eo pipefail

# configuration

if [[ ! $1 ]]
then
    printf "ERR: Absolute path to module root directory required.\n"
    exit 1
fi

declare MODULE_ROOT_DIR
MODULE_ROOT_DIR="$1"

# logic

## citizen

# Iterate a path loading each found module

cd .tmp/citizen || exit 1

declare CITIZEN_ADDR
CITIZEN_ADDR="https://localhost:3000"
export CITIZEN_ADDR

MODULE_ROOT_DIR="/Users/david/Projects/david_eddy/game-server"
for DIR in $MODULE_ROOT_DIR
do
    cd "$DIR" || exit 1
    for TAG in $(git tag)
    do
        printf "INFO: Processing %s module\n" "$DIR"
        citizen module localhost "$DIR" aws "$TAG"
    done
done
