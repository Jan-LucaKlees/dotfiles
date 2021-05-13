USE_POWERLINE="true"

# Source manjaro-zsh-configuration
if [[ -e /usr/share/zsh/manjaro-zsh-config ]]; then
  source /usr/share/zsh/manjaro-zsh-config
fi
# Use manjaro zsh prompt
if [[ -e /usr/share/zsh/manjaro-zsh-prompt ]]; then
  source /usr/share/zsh/manjaro-zsh-prompt
fi

# autojump allows jumping to directories with 'j'
if [[ -e /usr/share/autojump/autojump.zsh ]]; then
  source /usr/share/autojump/autojump.zsh
fi

# enable fzf keybindings
if [[ -e /usr/share/fzf/key-bindings.zsh ]]; then
  export FZF_CTRL_T_COMMAND="fd -H" # use fd with hidden files for this command
  source /usr/share/fzf/key-bindings.zsh
fi

# .alias.sh just contains some aliases, nothing fancy
source ~/.alias.sh

# make cd push the old directory onto the directory stack.
setopt auto_pushd

# avoid "beep"ing
setopt nobeep

