#!/bin/bash

BASH_LIBRARY_PROTECT=true

function protect_ask_not_to_exit() {
  # PIN=`env LC_CTYPE=C tr -dc "0-9" < /dev/urandom | head -c 4`
  PIN=`printf '%04d' $(( RANDOM % 10000 ))`

  read -t 1 -n 10000 discard
  read -p "Type $PIN to proceed: `echo $'\n> '`" answer

  if [ "$answer" != "$PIN" ]
  then
    echo "failed!"
    exit 1
  fi

}

export -f protect_ask_not_to_exit
