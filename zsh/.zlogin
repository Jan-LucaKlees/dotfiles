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
    print
    fortune -s
    print
  fi
fi

# unlock ssh key
# eval `ssh-agent`
# ssh-add $HOME/.ssh/id_rsa

# echo "Which display server to run?"
# select dps in "Wayland" "Xorg"; do
#     export JLK_DPS=$dps
#     case $dps in
#         Wayland )
#           export JLK_DPS_WAYLAND=true
#           if [ -z "$DISPLAY" ] && [[ $(tty) = /dev/tty1 ]]; then
#             export XKB_DEFAULT_LAYOUT=us
#             export XKB_DEFAULT_VARIANT=altgr-intl
#             export XKB_DEFAULT_OPTIONS=compose:menu,level3:ralt_switch
#             cat $HOME/.config/sway/config.base \
#                 $HOME/.config/sway/config.sway > $HOME/.config/sway/config
#             exec sway --my-next-gpu-wont-be-nvidia
#           fi
#           ;;
#         Xorg )
#           export JLK_DPS_XORG=true
#           if [ -z "$DISPLAY" ] && [ -n "$XDG_VTNR" ] && [ "$XDG_VTNR" -eq 1 ]; then
#             cat $HOME/.config/sway/config.base \
#                 $HOME/.config/i3/config.i3 > $HOME/.config/i3/config
#             exec startx
#           fi
#           ;;
#     esac
# done

