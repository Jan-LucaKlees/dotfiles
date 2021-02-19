# Defines environment variables.
export NVIM_TUI_ENABLE_TRUE_COLOR=1
export NVIM_TUI_ENABLE_CURSOR_SHAPE=1
export EDITOR='nvim'
export VISUAL='nvim'
export PAGER='less'
export BROWSER='chromium'

# set lang if not already set
if [[ -z "$LANG" ]]; then
  export LANG='en_US.UTF-8'
fi

# rust stuff
export RUST_SRC_PATH=$HOME/.rustup/toolchains/stable-x86_64-unknown-linux-gnu/lib/rustlib/src/rust/src
source "$HOME/.cargo/env"

# go
export GOPATH=$HOME/misc/go

# node / nvm
export NVM_DIR="$HOME/.nvm"
[ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh" # This loads nvm
[ -s "/usr/local/opt/nvm/etc/bash_completion.d/nvm" ] && . "/usr/local/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

