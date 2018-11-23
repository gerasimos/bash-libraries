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

## Modules

- [bl::col](#bl_col) (colors)
- [bl::log](#bl_log) (logger - to stdout by default)

### <a name="bl_col"></a>bl::col

Note that shell colors description is not consistent across all platforms, so you better run `$ ./bl_colors.sh test` to check what suits your environment.
Also, take care what colors you use, as in black backgrounds they might not look too highlighted.
For RGB colors, there are extra shortcut functions.

function|parameters|quick desc
---|---|---
`bl::col`  |  \$1=color, \$2=bold (optional) | sets the color
`bl::col::r`||Shortcuts Red
`bl::col::rb`||Shortcuts Red Bold
`bl::col::g`||Shortcuts Green
`bl::col::gb`||Shortcuts Green Bold
`bl::col::b`||Shortcuts Blue
`bl::col::bb`||Shortcuts Blue Bold 

```shell
echo "this is $(bl::col green) a green text $(bl::col)"
echo "this is $(bl::col::g) a green text $(bl::col)"
echo "this is $(bl::col green bold) a green bold text $(bl::col)"
echo "this is $(bl::col::gb) a green bold text $(bl::col)"
```

bl::col parameters|Color
---|---
`red`|Red
`red bold` or `redb`|Red Bold
`blue` or `blu`|Blue
`blue bold` or `blub`|Blue Bold
`green` or `gre`|Green Bold
`green bold` or `greb`|Green Bold
`black` or `bla` or `blk`|Black
`black bold` or `blab` or `blkb`|Black Bold
`purple` or `pur`|Purple
`purple bold` or `purb`|Purple Bold
`pine` or `pin`|Pine
`pine bold` or `pinb`|Pine Bold
`gray` or `gra`|Gray
`gray bold` or `grab`|Gray Bold
`cyan` or `cya`|Cyan
`cyan bold` or `cyab`|Cyan Bold



### <a name="bl_log"></a>bl::log
