#
# Executes commands at login pre-zshrc.
#

#
# Browser
#

export BROWSER='chromium'

#
# Editors
#

export EDITOR='nvim'
export VISUAL='nvim'
export PAGER='less'

#
# Language
#

if [[ -z "$LANG" ]]; then
  export LANG='en_US.UTF-8'
fi

# rust stuff
export RUST_SRC_PATH=/home/jlk/.rustup/toolchains/stable-x86_64-unknown-linux-gnu/lib/rustlib/src/rust/src

# go
export GOPATH=/home/jlk/misc/go

# node
export npm_config_prefix=/home/jlk/.node_modules


# Ensure path arrays do not contain duplicates.
typeset -gU cdpath fpath mailpath path

# Set the the list of directories that cd searches.
# cdpath=(
#   $cdpath
# )

# Set the list of directories that Zsh searches for programs.
path=(
  /usr/local/{bin,sbin}
  /home/jlk/.cargo/bin
  /home/jlk/.local/bin
  /home/jlk/.node_modules/bin
  /home/jlk/redshift/root/bin
  $path
)

# add dir with some completions to fpath
fpath=(
  /home/jlk/.zsh-completions
  $fpath
)

#
# Less
#

# Set the default Less options.
# Mouse-wheel scrolling has been disabled by -X (disable screen clearing).
# Remove -X and -F (exit if the content fits on one screen) to enable it.
export LESS='-F -g -i -M -R -S -w -X -z-4'

# Set the Less input preprocessor.
# Try both `lesspipe` and `lesspipe.sh` as either might exist on a system.
if (( $#commands[(i)lesspipe(|.sh)] )); then
  export LESSOPEN="| /usr/bin/env $commands[(i)lesspipe(|.sh)] %s 2>&-"
fi

#
# Temporary Files
#

if [[ ! -d "$TMPDIR" ]]; then
  export TMPDIR="/tmp/$LOGNAME"
  mkdir -p -m 700 "$TMPDIR"
fi

TMPPREFIX="${TMPDIR%/}/zsh"

# unlock ssh key
eval `ssh-agent`
ssh-add /home/jlk/.ssh/id_rsa

# auto start sway on login
if [ -z "$DISPLAY" ] && [[ $(tty) = /dev/tty1 ]]; then
  export XKB_DEFAULT_LAYOUT=us
  export XKB_DEFAULT_VARIANT=altgr-intl
  export XKB_DEFAULT_OPTIONS=compose:menu,level3:ralt_switch
  exec sway
fi

