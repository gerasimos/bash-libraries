#!/bin/bash

# source: https://stackoverflow.com/questions/5947742/how-to-change-the-output-color-of-echo-in-linux
# usage:
#	printf "This is $(color red) red color!"
#	echo "This is $(color green) green color!"

BASH_LIBRARY_COLORS=true

# constants
# colors
Black='30'
Red='31'
Green='32'
Pine='33'
Blue='34'
Purple='35'
Cyan='36'
Gray='37'

# COLOR_='\033[0m'
# COLOR_BLACK='\033[0;30m'
# COLOR_BLACK_BOLD='\033[1;30m'
# COLOR_RED='\033[0;31m'
# COLOR_RED_BOLD='\033[1;31m'
# COLOR_GREEN='\033[0;32m'
# COLOR_GREEN_BOLD='\033[1;32m'
# COLOR_PINE='\033[0;33m'
# COLOR_PINE_BOLD='\033[1;33m'
# COLOR_BLUE='\033[0;34m'
# COLOR_BLUE_BOLD='\033[1;34m'
# COLOR_PURPLE='\033[0;35m'
# COLOR_PURPLE_BOLD='\033[1;35m'
# COLOR_CYAN='\033[0;36m'
# COLOR_CYAN_BOLD='\033[1;36m'
# COLOR_GRAY='\033[0;37m'
# COLOR_GRAY_BOLD='\033[1;37m'


# usage: color COLOR <bold>
function color() {
	l_color=
	case $1 in
		black ) l_color=$Black
			;;
		red ) l_color=$Red
			;;
		green ) l_color=$Green
			;;
		pine ) l_color=$Pine
			;;
		blue ) l_color=$Blue
			;;
		purple ) l_color=$Purple
			;;
		cyan ) l_color=$Cyan
			;;
		gray ) l_color=$Gray
			;;
	esac
	if [ ! -z "$1" ]; then
		l_color=';'$l_color
	fi
	l_prefix='\033[0'
	if [ ! -z "$2" ]; then
		if [ "$2" = "bold" ]; then
			l_prefix='\033[1'
		fi
	fi
	printf $l_prefix$l_color'm'
}

function test {
	printf "`color black`black\n"
	printf "`color black bold`black bold\n"
	printf "`color red`red\n"
	printf "`color red bold`red bold\n"
	printf "`color gray`gray\n"
	printf "`color gray bold`gray bold\n"
	printf "`color green`green\n"
	printf "`color green bold`green bold\n"
	printf "`color pine`pine\n"
	printf "`color pine bold`pine bold\n"
	printf "`color blue`blue\n"
	printf "`color blue bold`blue bold\n"
	printf "`color purple`purple\n"
	printf "`color purple bold`purple bold\n"
	printf "`color cyan`cyan\n"
	printf "`color cyan bold`cyan bold\n"
	printf `color`

	printf "This is $(color red)red color in 'printf'!\n$(color)"
	echo "This is $(color green)green color in 'echo'!$(color)"
}

if [ "$1" = "test" ]
then
	test
fi

export -f color