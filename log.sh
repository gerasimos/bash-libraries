#!/bin/bash

BASH_LIBRARY_LOG=true
source $BASH_LIBRARIES_PATH/time.sh

function printDate() {
	timestamp "+%Y-%m-%d %H:%M:%S"
}

function printTime() {
	timestamp "+%H:%M:%S"
}

#####
# tests
function test() {
	echo "$(printDate)"
	echo "$(printTime)"
}

if [ "$1" = "test" ]
then
  test
fi
