#!/bin/sh

if [ -z "$1" ]; then
    echo "No scheme name!"
    echo "Usage: getCoverage <scheme>"
    exit 1
fi

if [ -n "$1" ]; then
      xcodebuild -scheme "$1" -derivedDataPath "build/" -destination 'platform=iOS Simulator,OS=11.4,name=iPhone 8' -enableCodeCoverage YES clean build test CODE_SIGN_IDENTITY="" CODE_SIGNING_REQUIRED=NO
    end
    xcrun xccov view build/Logs/Test/*.xccovreport
    xcrun xccov view --only-targets build/Logs/Test/*.xccovreport
fi
