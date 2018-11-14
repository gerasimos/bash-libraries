#!/bin/bash

BASH_LIBRARY_STRINGS=true
source $BASH_LIBRARIES_PATH/misc.sh

# usage: lower <STRING>
# $1 = input string
function lower() {
	echo $* | awk '{print tolower($0)}'
}

# usage: string_remove_spaces <STRING>
# $1 = input string
function string_remove_spaces() {
	$(echo -e "$1" | tr -d '[:space:]')
}

# usage: random_number_with_num_of_digits <NUMBER_OF_OUTPUT_DIGITS>
# $1 = number of digits
function random_number_with_num_of_digits() {
    if [ "$(uname)" == "Darwin" ]; then
      # OSX.
      env LC_CTYPE=C tr -dc "0-9" < /dev/urandom | head -c $1
    elif [ "$(expr substr $(uname -s) 1 5)" == "Linux" ]; then
      # Linux. Not tested
      head /dev/urandom | tr -dc 0-9 | head -c $1
    elif [ "$(expr substr $(uname -s) 1 10)" == "MINGW32_NT" ]; then
      # Windows. Not tested
      echo $((1 + RANDOM % 10^$1))
    fi
}

# usage: println ...
function println() {
	printf "$*\n"
}

# usage: kvp_get_value <FILENAME> <KEY>
# $1=source file
# $2=key
function kvp_get_value() {
	grep "^$2=" $1 | sed -E "s/$2=(.*)$/\1/" | head -1
}

# usage: kvp_set_value <FILENAME> <KEY> <VALUE>
# $1=source file
# $2=key
# $3=value
function kvp_set_value() {
	if [ -f "$1" ]; then
		sed -i "/$2=/d" $1
	fi
	echo "$2=$3" >> $1
}

#####
# tests
function test() {
	# lower
	println "\nlower()"
	lower "This will convert LOREM IPSUM to lowercase!"

	# random_number_with_num_of_digits
	println "\nrandom_number_with_num_of_digits()"
	for i in $(seq 1 10); do
		println "Random number with $i digits: $(random_number_with_num_of_digits $i)"
	done

	# kvp_get_value
	println "\nkvp_get_value()"
	v1="value value value 1"
	v2="timi timi timi 2"
	printf "key1=$v1\nkey2=$v2" > kvps
	vvv1=$(kvp_get_value kvps "key1")
	if [ "$vvv1" = "$v1" ]; then
		println "$vvv1 was OK"
	else
		println "$vvv1 ********FAILED*******"
	fi
	rm kvps

}

if [ "$1" = "test" ]
then
	test
fi

export -f lower
export -f random_number_with_num_of_digits
