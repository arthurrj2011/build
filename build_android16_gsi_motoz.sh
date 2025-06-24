#!/bin/bash

# Set up environment variables
export ANDROID_VERSION="android-16" # Replace with actual branch/tag if different
export DEVICE="moto_z"
export LUNCH_TARGET="treble_arm64_bgN-userdebug" # Adjust lunch target for Moto Z/GSI

# Clone the repo if not already present
if [ ! -d "treble_aosp" ]; then
  git clone https://github.com/arthurrj2011/treble_aosp.git
fi

cd treble_aosp

# Checkout the release branch/tag for Android 16
git fetch
git checkout $ANDROID_VERSION

# Source build environment
source build/envsetup.sh

# Lunch the GSI target (you may need to adjust based on actual targets provided)
lunch $LUNCH_TARGET

# Start the build (this builds a GSI system image)
make -j$(nproc) systemimage

# Output location
echo "Build complete. The GSI image should be in: out/target/product/generic_arm64/system.img"