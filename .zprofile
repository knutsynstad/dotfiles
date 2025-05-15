if [[ -z $DISPLAY ]] && [[ $(tty) = /dev/tty1 ]]; then
  source "$HOME/dotfiles/utils/env.sh"
  exec Hyprland
fi
