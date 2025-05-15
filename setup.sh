#!/bin/bash


#
#  ██████╗  █████╗ ████████╗███████╗██╗██╗     ███████╗ ██████╗
#  ██╔══██╗██╔══██╗╚══██╔══╝██╔════╝██║██║     ██╔════╝██╔════╝
#  ██║  ██║██║  ██║   ██║   █████╗  ██║██║     █████╗  ╚█████╗
#  ██║  ██║██║  ██║   ██║   ██╔══╝  ██║██║     ██╔══╝   ╚═══██╗
#  ██████╔╝╚█████╔╝   ██║   ██║     ██║███████╗███████╗██████╔╝
#  ╚═════╝  ╚════╝    ╚═╝   ╚═╝     ╚═╝╚══════╝╚══════╝╚═════╝
#


echo "Installing dotfiles ..."

# Install packages
./utils/packages.sh

# Create symlinks
./utiols/symlinks.sh

# Create any environment variables
source ./utils/env.sh

echo "✅ Setup complete. You might want to restart your shell or Hyprland."
