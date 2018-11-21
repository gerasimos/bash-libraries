#!/bin/bash

BASH_LIBRARY_LOG=true
source $BASH_LIBRARIES_PATH/time.sh
source $BASH_LIBRARIES_PATH/colors.sh

function printDate() {
	timestamp "+%Y-%m-%d %H:%M:%S"
}

function printTime() {
	timestamp "+%H:%M:%S"
}

function loginfo() {
	# resets the color as well :)
	echo "$(printDate) ${BASH_SOURCE[1]}:${FUNCNAME[1]} & $*$(color)"
}

function logerror() {
	echo "$(color red)$(printDate) ${BASH_SOURCE[1]}:${FUNCNAME[1]} & ERROR: $*$(color)"
}

function logwarn() {
	echo "$(color pine)$(printDate) ${BASH_SOURCE[1]}:${FUNCNAME[1]} & WARN: $*$(color)"
}

#####
# tests
function log_test() {
	echo "$(printDate)"
	echo "$(printTime)"
}

if [ "$1" = "test" ]
then
  log_test
fi
