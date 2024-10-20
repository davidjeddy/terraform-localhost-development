#!/bin/bash

set -eo pipefail

# shellcheck disable=SC1091
source "./config.sh" || exiti 1

# logic 

if [[ ! $1 ]]
then
    printf "ERR: Absolute path to module root directory required.\n"
    exit 1
fi

declare MODULE_ROOT_DIR
MODULE_ROOT_DIR="$1"
export MODULE_ROOT_DIR

# logic

## citizen

# Iterate a path loading each found module

cd .tmp/citizen || exit 1

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

PATH="/Users/david/Projects/david_eddy/terraform-localhost-development/.tmp/citizen/bin:$PATH"
echo "$PATH"
which citizen
source "/Users/david/Projects/david_eddy/terraform-localhost-development/libs/bash/config.sh" || exit 1
NODE_EXTRA_CA_CERTS=""

citizen module testing terraform-aws-log-exporter aws 1.1.1
