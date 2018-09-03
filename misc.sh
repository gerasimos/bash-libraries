#!/bin/bash

BASH_LIBRARY_COMMONS=true

# usage: killme <MESSAGE_TO_SHOW>
# $1=message to show
function killme() {
	echo "$(color red bold)$(printDate) $*$(color)"
	exit 1
}

# usage: is_pid_listed_in_ps <PID>
# $1=PID
function is_pid_listed_in_ps() {
	ps -ax | sed -e 's/^[[:space:]]*//' | cut -d' ' -f1 | grep $1
}

# usage: is_keyword_listed_in_pgrep <KEYWORD>
# $1=keyword
function is_keyword_listed_in_pgrep() {
	pgrep -f $1
}

# usage: get_os
function get_os() {
	if [ "$(uname)" == "Darwin" ]; then
		echo "osx"
	elif [ "$(expr substr $(uname -s) 1 5)" == "Linux" ]; then
		echo "linux"
	elif [ "$(expr substr $(uname -s) 1 10)" == "MINGW32_NT" ]; then
		echo "cygwin"
	fi
}

# $1 {BASH_SOURCE[0]}
function file_folder() {
	echo $( cd "$( dirname "$1" )" && pwd )
}

# $1=argument name
# $2=variable
function check_argument() {
	if [ -z "$2" ]; then
		echo "ERROR: $1 was not defined"
		echo "usage: $usage"
		exit 1
	fi
}

export -f file_folder
