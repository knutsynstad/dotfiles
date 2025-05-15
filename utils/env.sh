#!/bin/bash


#  ███████╗███╗░░██╗██╗░░░██╗
#  ██╔════╝████╗░██║██║░░░██║
#  █████╗░░██╔██╗██║╚██╗░██╔╝
#  ██╔══╝░░██║╚████║░╚████╔╝░
#  ███████╗██║░╚███║░░╚██╔╝░░
#  ╚══════╝╚═╝░░╚══╝░░░╚═╝░░░


#  █▀▀ █░█ ▄▀█ █▀█ █▀▄
#  █▄█ █▄█ █▀█ █▀▄ █▄▀

# Guard against sourcing multiple times
if [ -n "$ENV_SH_SOURCED" ]; then
  return
fi
export ENV_SH_SOURCED=1



#  █░█ ▄▀█ █▀█ █ ▄▀█ █▄▄ █░░ █▀▀ █▀
#  ▀▄▀ █▀█ █▀▄ █ █▀█ █▄█ █▄▄ ██▄ ▄█

# Example environment variables
export EDITOR="nano"
export TERMINAL="kitty"
export BROWSER="firefox"
export PATH="$HOME/.local/bin:$PATH"

# Set locale if needed
export LANG="en_US.UTF-8"
export LC_ALL="en_US.UTF-8"

# Wayland/XDG environment variables (example)
export XDG_SESSION_TYPE="wayland"
export XDG_CURRENT_DESKTOP="Hyprland"

# other stuff
  export WLR_NO_HARDWARE_CURSORS=1
  export WLR_RENDERER_ALLOW_SOFTWARE=1
  export LIBVA_DRIVER_NAME=nvidia
  export GBM_BACKEND=nvidia-drm
  export __GLX_VENDOR_LIBRARY_NAME=nvidia
  export __GL_GSYNC_ALLOWED=1
  export __GL_VRR_ALLOWED=1
  export QT_QPA_PLATFORMTHEME=qt6ct
  export QT_STYLE_OVERRIDE=kvantum
  export PATH="$PATH:$HOME/.local/bin"
  export NOBROWSER=1
  export ELECTRON_OZONE_PLATFORM_HINT=auto
  export QT_QPA_PLATFORM=wayland
  export GDK_BACKEND=wayland
