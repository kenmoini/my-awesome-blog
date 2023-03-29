#!/bin/bash

## Get the directory this script lives in
SCRIPT_DIR=$(dirname ${BASH_SOURCE[0]})
SCRIPT_DIR=$(cd $SCRIPT_DIR && pwd)

## Load the partial-arch.sh helper
cd $SCRIPT_DIR
source partial-arch.sh

# Get the latest Hugo Extended Edition Release URL
LATEST_HUGO_VERSION_URL=$(curl -sSL https://api.github.com/repos/gohugoio/hugo/releases/latest | jq -r '.assets[] | select(.browser_download_url | contains("'${PLATFORM_TYPE}'")) | .browser_download_url' | grep 'extended' | grep 'tar' | grep "$TARGET_ARCH")

## Make/Enter a temp directory
mkdir /tmp/hugobin
cd /tmp/hugobin

# Download the latest version
wget -O hugo.tar.gz "${LATEST_HUGO_VERSION_URL}"

# Extract the release package
tar zxvf hugo.tar.gz

# Move the Hugo binary so it can build on different system types
# ie, one for Ubuntu GitHub Action Runners and one for your Mac
mv hugo ${SCRIPT_DIR}/../bin/hugo-${PLATFORM_TYPE}-${TARGET_ARCH}

# Clean up
cd $SCRIPT_DIR
rm -rf /tmp/hugobin
