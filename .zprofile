if [[ -z $DISPLAY ]] && [[ $(tty) = /dev/tty1 ]]; then
  source "$HOME/dotfiles/utils/env.sh"
  exec start-hyprland
fi
