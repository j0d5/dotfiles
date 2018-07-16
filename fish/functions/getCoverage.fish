function getCoverage --description 'Runs UnitTests of given scheme and gets the coverage data'
    if test -n $argv[1]
      xcodebuild -scheme "$argv[1]" -derivedDataPath "build/" -destination 'platform=iOS Simulator,OS=11.4,name=iPhone 8' -enableCodeCoverage YES clean build test CODE_SIGN_IDENTITY="" CODE_SIGNING_REQUIRED=NO
    end
    xcrun xccov view build/Logs/Test/*.xccovreport
    xcrun xccov view --only-targets build/Logs/Test/*.xccovreport
end
