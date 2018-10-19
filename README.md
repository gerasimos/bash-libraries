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

In case you are using Mac OSX, make sure to [brew](https://brew.sh/) install:

```shell
brew install gnu-sed --with-default-names
brew install coreutils
```

and add the following line to `.bash_profile` or `.bashrc` or whatever file you define your `$PATH` in order to use the GNU utlis with their original name and not prefixed with a `g`:

```shell
export PATH="$(brew --prefix coreutils)/libexec/gnubin:$PATH"
```
