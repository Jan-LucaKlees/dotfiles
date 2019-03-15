# Execute code that does not affect the current session in the background.
{
  # Compile the completion dump to increase startup speed.
  zcompdump="${ZDOTDIR:-$HOME}/.zcompdump"
  if [[ -s "$zcompdump" && (! -s "${zcompdump}.zwc" || "$zcompdump" -nt "${zcompdump}.zwc") ]]; then
    zcompile "$zcompdump"
  fi
} &!

# Print a random, hopefully interesting, adage.
if (( $+commands[fortune] )); then
  if [[ -t 0 || -t 1 ]]; then
    fortune -s
    print
  fi
fi

# unlock ssh key
eval `ssh-agent`
ssh-add /home/jlk/.ssh/id_rsa

# auto start sway on login
if [ -z "$DISPLAY" ] && [[ $(tty) = /dev/tty1 ]]; then
  export XKB_DEFAULT_LAYOUT=us
  export XKB_DEFAULT_VARIANT=altgr-intl
  export XKB_DEFAULT_OPTIONS=compose:menu,level3:ralt_switch
  exec sway --my-next-gpu-wont-be-nvidia
fi

