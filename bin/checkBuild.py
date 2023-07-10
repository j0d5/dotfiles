#!/usr/bin/env python3

import os
import subprocess
import sys
from optparse import OptionParser


def checkArchitecture(fileName):
    print("Checking " + fileName + " for architectures...")
    print(
        subprocess.getoutput("lipo -info " + fileName + ' | rev | cut -d ":" -f1 | rev')
    )
    print()


def checkCoverageSymbols(fileName):
    print("Checking " + fileName + " for coverage symbols...")
    output = subprocess.getoutput(
        "otool -l -arch all " + fileName + " | grep __llvm_cov"
    )
    if output != "":
        print("contains coverage symbols!")
    else:
        print("does not contain coverage symbols!")
    print()


def checkProfilingData(fileName):
    print("Checking " + fileName + " for profiling data...")
    output = subprocess.getoutput("otool -l -arch all " + fileName + " | grep __llvm_")
    if output != "":
        print("contains profiling symbols!")
    else:
        print("does not contain profiling symbols!")
    print()


def checkEncryption(fileName):
    print("Checking " + fileName + " for encryption symbols...")
    output = subprocess.getoutput(
        "otool -l " + fileName + " | grep -q LC_ENCRYPTION_INFO"
    )
    if output != "":
        print("contains encryption symbols!")
    else:
        print("does not contain encryption symbols!")
    print()


def checkBitcodeAvailability(fileName):
    print("Checking " + fileName + " for bitcode data...")
    print()


def checkForAssertion(fileName):
    print("Checking " + fileName + " for assertions...")
    output = subprocess.getoutput("nm " + fileName + ' | grep "NSAssertionHandler"')
    if output != "":
        print("contains assertions!")
    else:
        print("does not contain assertions!")
    print()


def checkDebugSymbols(fileName):
    print("Checking " + fileName + " for debug symbols...")
    print()


if __name__ == "__main__":
    usage = "usage: %prog [options] filename"
    parser = OptionParser(usage=usage, version="%prog 1.0")
    parser.add_option(
        "-a",
        "--arch",
        action="store_true",
        dest="arch",
        help="check which architectures the build contains",
    )
    parser.add_option(
        "-c",
        "--coverage",
        action="store_true",
        dest="cov",
        help="check if the binary contains forbidden coverage data",
    )
    parser.add_option(
        "-p",
        "--profiling",
        action="store_true",
        dest="prof",
        help="check if the file contains profiling information",
    )
    parser.add_option(
        "-e",
        "--encryption",
        action="store_true",
        dest="enc",
        help="check if the file contains encryption information",
    )
    parser.add_option(
        "-b",
        "--bitcode",
        action="store_true",
        dest="bit",
        help="check if the file contains bitcode information",
    )
    parser.add_option(
        "-x",
        "--assertion",
        action="store_true",
        dest="ass",
        help="check if the file contains assertions",
    )
    parser.add_option(
        "-d",
        "--debug",
        action="store_true",
        dest="debug",
        help="check if the binary contains forbidden debug symbols",
    )
    parser.add_option(
        "-t",
        "--test",
        action="store_true",
        dest="test",
        help="check if the unit tests contain any forbidden flags",
    )
    (options, args) = parser.parse_args()
    # print(args)

    if len(args) < 1:
        parser.error(
            "Must give at least a file name! Call with -h or --help if you need help."
        )
        sys.exit()

    if options.arch:
        checkArchitecture(args[0])
    elif options.cov:
        checkCoverageSymbols(args[0])
    elif options.prof:
        checkProfilingData(args[0])
    elif options.enc:
        checkEncryption(args[0])
    elif options.bit:
        checkBitcodeAvailability(args[0])
    elif options.ass:
        checkForAssertion(args[0])
    elif options.debug:
        checkDebugSymbols(args[0])
    elif options.test:
        print("Check if tests have been forced...")
    else:
        checkArchitecture(args[0])
        checkCoverageSymbols(args[0])
        checkProfilingData(args[0])
        checkEncryption(args[0])
        checkBitcodeAvailability(args[0])
        checkForAssertion(args[0])
        checkDebugSymbols(args[0])
