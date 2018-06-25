#!/bin/bash

if [ -z "$BASH_LIBRARIES_PATH" ]; then
	echo "BASH_LIBRARIES_PATH is not defined. Need to define the full path."
	exit 1
fi

source $BASH_LIBRARIES_PATH/colors.sh
source $BASH_LIBRARIES_PATH/log.sh
source $BASH_LIBRARIES_PATH/strings.sh
source $BASH_LIBRARIES_PATH/time.sh
source $BASH_LIBRARIES_PATH/misc.sh
source $BASH_LIBRARIES_PATH/protect.sh
