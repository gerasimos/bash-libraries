#!/bin/bash

BASH_LIBRARY_TIME=true

source $BASH_LIBRARIES_PATH/strings.sh
source $BASH_LIBRARIES_PATH/misc.sh

# usage: seconds_to_time <NUMBER_OF_SECONDS>
# $1=number of seconds
function seconds_to_time () {
    num=$1
    min=0
    hour=0
    day=0
    if((num>59));then
        ((sec=num%60))
        ((num=num/60))
        if((num>59));then
            ((min=num%60))
            ((num=num/60))
            if((num>23));then
                ((hour=num%24))
                ((day=num/24))
            else
                ((hour=num))
            fi
        else
            ((min=num))
        fi
    else
        ((sec=num))
    fi
    echo "$day"d "$hour"h "$min"m "$sec"s
}

floor () {
  DIVIDEND=${1}
  DIVISOR=${2}
  RESULT=$(( ( ${DIVIDEND} - ( ${DIVIDEND} % ${DIVISOR}) )/${DIVISOR} ))
  echo ${RESULT}
}

# usage: countdown <SECONDS>
# $1 = seconds
function countdown(){
  s=${1}
  HOUR=$(floor ${s} 60/60 )
  s=$((${s}-(60*60*${HOUR})))
  MIN=$(floor ${s} 60 )
  SEC=$((${s}-60*${MIN}))
  while [ $HOUR -ge 0 ]; do
    while [ $MIN -ge 0 ]; do
            while [ $SEC -ge 0 ]; do
                    printf "%02d:%02d:%02d\033[0K\r" $HOUR $MIN $SEC
                    SEC=$((SEC-1))
                    sleep 1
            done
            SEC=59
            MIN=$((MIN-1))
    done
    MIN=59
    HOUR=$((HOUR-1))
  done
}

# usage: timestamp <FORMAT>
# $1=format
function timestamp() {
  os=$(get_os)
  if [ "$os" == "linux" ] || [ "$os" == "cygwin" ]; then
    date "$*"
  elif [ "$os" == "osx" ]; then
    date -j "$*"
  fi
}

#####
# tests
function test() {
  # seconds_to_time
  println "\nseconds_to_time()"
  for s in 45 456 23445; do
    println "$s seconds are displayed as: $(seconds_to_time $s)"
  done

  # countdown
  println "\countdown()"
  countdown 10

}

if [ "$1" = "test" ]
then
  test
fi

export -f seconds_to_time
export -f countdown
