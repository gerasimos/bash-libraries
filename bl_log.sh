#!/bin/bash

BASH_LIBRARY_LOG=true
source $BASH_LIBRARIES_PATH/time.sh
source $BASH_LIBRARIES_PATH/bl_colors.sh

function bl::log::_date() {
	timestamp "+%Y-%m-%d %H:%M:%S"
}

function bl::log::_time() {
	timestamp "+%H:%M:%S"
}

function bl::log::i() {
	# resets the color as well :)
	echo "$(bl::col blk)$(bl::log::_date) ${BASH_SOURCE[1]}:${FUNCNAME[1]} & $*$(bl::col)"
}

function bl::log::w() {
	# resets the color as well :)
	echo "$(bl::col pin)$(bl::log::_date) ${BASH_SOURCE[1]}:${FUNCNAME[1]} & WARN: $*$(bl::col)"
}

function bl::log::e() {
	# resets the color as well :)
	echo "$(bl::col::r)$(bl::log::_date) ${BASH_SOURCE[1]}:${FUNCNAME[1]} & ERROR: $*$(bl::col)"
}

function bl::log::stderr() {
	while read line; do 
		bl::log::e $line >&2
	done
}

#####
# tests
function bl::log::test() {
	echo "$(bl::log::_date)"
	echo "$(bl::log::_logtime)"
}

if [ "$1" = "test" ]
then
  bl::log::test
fi
