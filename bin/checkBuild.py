#!/usr/bin/env python3

import os, sys
import subprocess
from optparse import OptionParser

def checkArchitecture(fileName):
    print("Check for architectures...")
    #print(subprocess.check_output(['ls','-l']))

if __name__ == "__main__":
    print("Hello World")
    usage = "usage: %prog [options]"
    parser = OptionParser(usage=usage)
    parser.add_option("-a", "--arch", dest="arch", help="Check which architectures the build contains")
    parser.add_option("-t", "--test", dest="test",
            help="Check if the unit tests contain any forbidden flags")
    parser.add_option("--coverage", dest="cov",
            help="Check if the binary contains forbidden coverage data")
    parser.add_option("--debug", dest="debug",
            help="Check if the binary contains forbidden debug symbols")
    (options, args) = parser.parse_args()
    print(args)

    if (options.arch):
        checkArchitecture(args)
    elif (options.test):
        print("Check if tests have been forced...")
    elif (options.cov):
        print("Check for coverage symbols...")
    elif (options.debug):
        print("Check for debug symbols...")
    else:
        parser.error("Must give at least one option")
