#!/bin/bash

set -eo pipefail

# shellcheck disable=SC1091
source "$HOME"/.bashrc || ex./iti 1
# shellcheck disable=SC1091
source ./libs/bash/config.sh || ex./iti 1

# logic 

# exp: /Users/david/Projects/github/terraform-aws-log-exporter
if [[ ! $1 ]]
then
    printf "ERR: Absolute path to module root directory required.\n"
    exit 1
fi

delcare PROVIDER
if [[ ! $2 ]]
then
    PROVIDER="aws"
fi
export PROVIDER
printf "INFO: PROVIDER is %s\n" "$PROVIDER"

declare MODULE_ROOT_DIR
MODULE_ROOT_DIR="$1"
export MODULE_ROOT_DIR
printf "INFO: MODULE_ROOT_DIR is %s\n" "$MODULE_ROOT_DIR"

# logic

## citizen

# Iterate a path loading each found module
CITIZEN_ADDR="https://$CITIZEN_ADDR"
printf "INFO: CITIZEN_ADDR: %s\n" "$CITIZEN_ADDR"

for DIR in $MODULE_ROOT_DIR
do
    cd "$DIR" || exit 1
    for TAG in $(git tag)
    do
        printf "INFO: Processing %s module with provider %s tag %s\n" "$DIR" "$PROVIDER" "$TAG"
        NODE_EXTRA_CA_CERTS="" citizen module testing "$DIR" "$PROVIDER" "$TAG"
    done
done
