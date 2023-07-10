#!/bin/sh
set -e

# fonts color
RED="31m"
GREEN="32m"
YELLOW="33m"
BLUE="34m"
WHITE="0m"

__print() {
  if [ "$2" = "info" ]; then
    COLOR=${BLUE}
  elif [ "$2" = "success" ]; then
    COLOR=${GREEN}
  elif [ "$2" = "warning" ]; then
    COLOR=${YELLOW}
  elif [ "$2" = "error" ]; then
    COLOR=${RED}
  else
    COLOR=${WHITE}
  fi

  printf "\\033[0;%s ▸ %s" '\033[0m' $COLOR "$1"
}

if [ -z "$1" ]; then
  __print "No scheme name!" "error"
  __print "Usage: getCoverage <scheme>" "info"
  exit 1
fi

if [ -n "$(command -v xcpretty)" ]; then
  XCPRETTY=xcpretty
fi

IPHONE="iPhone 5s"
OS="12.0"
__print "Run build" "info"
xcodebuild -scheme "$1" -derivedDataPath "build/" -destination "platform=iOS Simulator,OS=${OS},name=${IPHONE}" -enableCodeCoverage YES clean build test CODE_SIGN_IDENTITY="" CODE_SIGNING_REQUIRED=NO | ${XCPRETTY}

if [ -f "build/Logs/Test/*.xccovreport" ]; then
  __print "Run xccov" "info"
  xcrun xccov view build/Logs/Test/*.xccovreport
  xcrun xccov view --only-targets build/Logs/Test/*.xccovreport
else
  __print "No coverage files found. Check your coverage generation settings."
fi
