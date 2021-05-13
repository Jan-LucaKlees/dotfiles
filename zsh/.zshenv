# Defines environment variables.
export EDITOR='nvim'
export VISUAL='nvim'
export PAGER='less'
export BROWSER='firefox'

# set lang if not already set
if [[ -z "$LANG" ]]; then
  export LANG='en_US.UTF-8'
fi

# nvim
export NVIM_TUI_ENABLE_TRUE_COLOR=1
export NVIM_TUI_ENABLE_CURSOR_SHAPE=1

# rust
export RUST_SRC_PATH=~/.rustup/toolchains/stable-x86_64-unknown-linux-gnu/lib/rustlib/src/rust/src

# go
export GOPATH=~/misc/go

# node
export npm_config_prefix=~/.node_modules

# make
export MAKEFLAGS="-j4"

# less
export LESS='-F -g -i -M -R -S -w -z-4'

