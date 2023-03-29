# Get the platform type
PLATFORM_TYPE=$(uname | tr '[:upper:]' '[:lower:]')
echo "Platform type: $PLATFORM_TYPE"

# Get the platform architecture
PLATFORM_ARCH=$(uname -m | sed 's/x86_64/amd64/')
echo "Platform architecture: $PLATFORM_ARCH"

# Some weird hacky glue stuff
TARGET_ARCH=$PLATFORM_ARCH
if [[ "$PLATFORM_TYPE" == "darwin" ]] && [[ "$PLATFORM_ARCH" == "arm64" ]]; then TARGET_ARCH="universal"; fi
echo "Target architecture: $TARGET_ARCH"
