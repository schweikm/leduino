#!/bin/bash


###############################################################################
#
# Top-level build script for Jenkins
#
###############################################################################


#### These variables need to be defined for every machine ####
GTEST_DIR=

if [ `hostname` = megatron ]
then
    GTEST_DIR=/opt/COTS/defaults/gtest
    INO_DIR=/opt/COTS/defaults/ino
	ARDUINO_DIR=/opt/COTS/defaults/arduino-sdk
fi


#### Environment variables ####
export PYTHONPATH=${PYTHONPATH}:${INO_DIR}/lib/python2.7/site-packages

#### These product versions are special ####

## Google Test ##
GTESTVER=`head -1 $GTEST_DIR/CHANGES | cut -d ' ' -f 3`
GTESTVER=${GTESTVER%?}  # remove last character


# set the column widths
readonly COL1SIZE=12
readonly COL2SIZE=86

# table character
readonly TABLECHAR="-"

function printEnds {
    for((i = 0; i < $COL1SIZE + $COL2SIZE + 11; i++))
    do
        printf "%s" $TABLECHAR
    done
    printf "\n"
}

function printRemaining {
    strLen=$1
    colSize=$2
    for((i = $1; i < $colSize; i++))
    do
        printf "%s" " "
    done
}

function printVersion {
    name=$1
    nameLen=${#name}
    version=$2
    versionLen=${#version}

    printf "|  %s" "$name"
    printRemaining $nameLen $COL1SIZE
    printf "  |  %s  " "$version"
    printRemaining $versionLen $COL2SIZE
    printf "|\n"
}

echo
echo
echo "====================================="
echo "==== Step 1: Dependency versions ===="
echo "====================================="
echo
echo

# header
printEnds

# print the versions
printVersion "Arduino SDK" "$(sed -n 2p ${ARDUINO_DIR}/revisions.txt)"
printVersion "Bash" "$(bash --version | head -1)"
printVersion "Doxygen" "$(doxygen --version)"
printVersion "G++" "$(g++ --version | head -1)"
printVersion "Google Test" "$GTESTVER"
printVersion "Linux Kernel" "$(uname -r)"
printVersion "Make" "$(make --version | head -1)"
printVersion "Python" "$(python --version 2>&1 > /dev/null)"

# footer
printEnds


# farm the work out to other scripts
./jenkins_compile.sh
./jenkins_test.sh
./jenkins_tools.sh
echo
echo

