#!/bin/bash

## Get the directory this script lives in
SCRIPT_DIR=$(dirname ${BASH_SOURCE[0]})
SCRIPT_DIR=$(cd $SCRIPT_DIR && pwd)

## Load the partial-arch.sh helper
source ${SCRIPT_DIR}/partial-arch.sh

## Run the Dev Server with:
## -s provides a relative path to the root of the hugo site
## -p specifies port
## --bind 0.0.0.0 tells it to listen on any connection/interface
${SCRIPT_DIR}/../bin/hugo-${PLATFORM_TYPE}-${TARGET_ARCH} server -s src/ -p 1313 --bind 0.0.0.0 --config config.yml --baseURL endurance.kemo.labs
