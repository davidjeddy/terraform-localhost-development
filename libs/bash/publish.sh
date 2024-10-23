#!/bin/bash

set -eo pipefail

# shellcheck disable=SC1091
source "$HOME"/.bashrc || ex./iti 1
# shellcheck disable=SC1091
source ./libs/bash/config.sh || ex./iti 1

# logic 

# exp: /Users/david/Projects/github/terraform-aws-log-exporter
declare MODULE_ROOT_DIR
# MODULE_ROOT_DIR="$1"
# if [[ ! $1 ]]
# then
#     printf "ERR: Absolute path to module root directory required.\n"
#     exit 1
# fi
MODULE_ROOT_DIR="/Users/david/Projects/github/terraform-aws-log-exporter"
export MODULE_ROOT_DIR
printf "INFO: MODULE_ROOT_DIR is %s\n" "$MODULE_ROOT_DIR"

declare NAMESPACE
NAMESPACE="$2"
if [[ ! $2 ]]
then
    printf "WARM: Module namespace not set, using \'test-namespace\'.\n"
    NAMESPACE="test-namespace"
fi
export NAMESPACE
printf "INFO: NAMESPACE is %s\n" "$NAMESPACE"

declare PROVIDER
PROVIDER="$3"
if [[ ! $3 ]]
then
    printf "WARM: Module provider not set, using \'aws\'.\n"
    PROVIDER="aws"
fi
export PROVIDER
printf "INFO: PROVIDER is %s\n" "$PROVIDER"

# logic

## citizen

# Iterate a path loading each found module
CITIZEN_ADDR="https://$CITIZEN_ADDR"
printf "INFO: CITIZEN_ADDR: %s\n" "$CITIZEN_ADDR"

declare MODULE_NAME
MODULE_NAME=""
for DIR in $MODULE_ROOT_DIR
do
    cd "$DIR" || exit 1
    printf "INFO: Changing into %s directory.\n" "$DIR"
    MODULE_NAME="test-module"
    printf "INFO: MODULE_NAME is %s\n" "$MODULE_NAME"
    # for VERSION in $(git tag)
    # do
        VERSION="1.1.1"
        printf "INFO: Processing \'citizen module [options] %s <name> <provider> <version>\'" "$NAMESPACE" "$MODULE_NAME" "$PROVIDER" "$VERSION"
        # citizen module [options] <namespace> <name> <provider> <version>
        citizen module "$NAMESPACE" "$MODULE_NAME" "$PROVIDER" "$VERSION"
    # done
done
