#!/bin/bash

# source: https://stackoverflow.com/questions/5947742/how-to-change-the-output-color-of-echo-in-linux
# usage:
#	printf "This is $(color red) red color!"
#	echo "This is $(color green) green color!"

BASH_LIBRARY_COL=true

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
function bl::col() {
	local l_color=
	local l_prefix='\033[0'
	local l_input=$1
	local pre3=${l_input:0:3}
	local suf1=${l_input:(-1)}
	case $pre3 in
		bla | blk) l_color=$Black
			;;
		red ) l_color=$Red
			;;
		gre ) l_color=$Green
			;;
		pin ) l_color=$Pine
			;;
		blu ) l_color=$Blue
			;;
		pur ) l_color=$Purple
			;;
		cya ) l_color=$Cyan
			;;
		gra ) l_color=$Gray
			;;
	esac
	if [ ! -z "$1" ]; then
		l_color=';'$l_color
	fi

	if [ "$suf1" == "b" ]; then
		l_prefix='\033[1'
	fi

	if [ ! -z "$2" ]; then
		if [ "$2" = "bold" ]; then
			l_prefix='\033[1'
		fi
	fi
	printf $l_prefix$l_color'm'
}

# Shortcuts RBG
function bl::col::r() {
	bl::col red
}
function bl::col::rb() {
	bl::col redb
}
function bl::col::g() {
	bl::col gre
}
function bl::col::gb() {
	bl::col greb
}
function bl::col::b() {
	bl::col blu
}
function bl::col::bb() {
	bl::col blub
}

function bl::col::test() {
	printf "`bl::col black`black\n"
	printf "`bl::col black bold`black bold\n"
	printf "`bl::col red`red\n"
	printf "`bl::col red bold`red bold\n"
	printf "`bl::col gray`gray\n"
	printf "`bl::col gray bold`gray bold\n"
	printf "`bl::col green`green\n"
	printf "`bl::col green bold`green bold\n"
	printf "`bl::col pine`pine\n"
	printf "`bl::col pine bold`pine bold\n"
	printf "`bl::col blue`blue\n"
	printf "`bl::col blue bold`blue bold\n"
	printf "`bl::col purple`purple\n"
	printf "`bl::col purple bold`purple bold\n"
	printf "`bl::col cyan`cyan\n"
	printf "`bl::col cyan bold`cyan bold\n"
	printf `bl::col`

	printf "`bl::col bla`black\n"
	printf "`bl::col blab`black bold\n"
	printf "`bl::col red`red\n"
	printf "`bl::col redb`red bold\n"
	printf "`bl::col gra`gray\n"
	printf "`bl::col grab`gray bold\n"
	printf "`bl::col gre`green\n"
	printf "`bl::col greb`green bold\n"
	printf "`bl::col pin`pine\n"
	printf "`bl::col pinb`pine bold\n"
	printf "`bl::col blu`blue\n"
	printf "`bl::col blub`blue bold\n"
	printf "`bl::col pur`purple\n"
	printf "`bl::col purb`purple bold\n"
	printf "`bl::col cya`cyan\n"
	printf "`bl::col cyab`cyan bold\n"
	printf `bl::col`

	printf "`bl::col::r`red\n"
	printf "`bl::col::rb`red bold\n"
	printf "`bl::col::g`green\n"
	printf "`bl::col::gb`green bold\n"
	printf "`bl::col::b`blue\n"
	printf "`bl::col::bb`blue bold\n"
	

	printf "This is $(bl::col red)red color in 'printf'!\n$(bl::col)"
	echo "This is $(bl::col gre)green color in 'echo'!$(bl::col)"
}

if [ "$1" = "test" ]
then
	bl::col::test
fi

export -f bl::col
export -f bl::col::r
export -f bl::col::rb
export -f bl::col::b
export -f bl::col::bb
export -f bl::col::g
export -f bl::col::gb