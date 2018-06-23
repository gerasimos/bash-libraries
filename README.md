# bash-libraries

A collection of bash functions to accelerate simple DevOps scripting.

## How to use

Add the following lines in the beginning of your script:

```shell
# Assuming that you have clone bash-libraries
BASH_LIBRARIES_PATH=<THE_PATH_WHERE_bash-libraries_ARE>
source $BASH_LIBRARIES_PATH/bash-libraries.sh

...

# your code continues here...

```

## Note for OSX

Though bash-libraries targets cross-OS compatibility, there is currently one exception for OSX:

you need to `brew install gnu-sed` in order to keep bash-libraries as-is. Otherwise, you will need to alter all `sed -i ...` commands to `sed -i '' ...`