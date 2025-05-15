#!/bin/bash


#
#  ██████╗  █████╗ ████████╗███████╗██╗██╗     ███████╗ ██████╗
#  ██╔══██╗██╔══██╗╚══██╔══╝██╔════╝██║██║     ██╔════╝██╔════╝
#  ██║  ██║██║  ██║   ██║   █████╗  ██║██║     █████╗  ╚█████╗
#  ██║  ██║██║  ██║   ██║   ██╔══╝  ██║██║     ██╔══╝   ╚═══██╗
#  ██████╔╝╚█████╔╝   ██║   ██║     ██║███████╗███████╗██████╔╝
#  ╚═════╝  ╚════╝    ╚═╝   ╚═╝     ╚═╝╚══════╝╚══════╝╚═════╝
#


#  █▀▀ █ █ ▄▀█ █▀█ █▀▄ █▀
#  █▄█ █▄█ █▀█ █▀▄ █▄▀ ▄█

# Exit immediately if something fails
set -e

# Prevent running as root
if [ "$EUID" -eq 0 ]; then
  echo "Do NOT run this script as root."
  exit 1
fi


#  █▀█ █ █▀█ █▀▀ █   █ █▄ █ █▀▀
#  █▀▀ █ █▀▀ ██▄ █▄▄ █ █ ▀█ ██▄

echo "Installing dotfiles ..."

# Install packages
./utils/packages.sh

# Create symlinks
./utils/symlinks.sh

# Create any environment variables
source ./utils/env.sh

echo "✅ Setup complete. You might want to restart your shell or Hyprland."
