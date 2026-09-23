#!/bin/bash


#   ██████╗██╗   ██╗███╗   ███╗██╗     ██╗███╗  ██╗██╗  ██╗ ██████╗
#  ██╔════╝╚██╗ ██╔╝████╗ ████║██║     ██║████╗ ██║██║ ██╔╝██╔════╝
#  ╚█████╗  ╚████╔╝ ██╔████╔██║██║     ██║██╔██╗██║█████═╝ ╚█████╗
#   ╚═══██╗  ╚██╔╝  ██║╚██╔╝██║██║     ██║██║╚████║██╔═██╗  ╚═══██╗
#  ██████╔╝   ██║   ██║ ╚═╝ ██║███████╗██║██║ ╚███║██║ ╚██╗██████╔╝
#  ╚═════╝    ╚═╝   ╚═╝     ╚═╝╚══════╝╚═╝╚═╝  ╚══╝╚═╝  ╚═╝╚═════╝


# Give up immediately if something fails
set -e

echo "Creating symlinks ..."

DOTFILES="$HOME/dotfiles"

mkdir -p "$HOME/.config"


# Config directories

ln -sfn "$DOTFILES/.config/hypr" "$HOME/.config/hypr"
ln -sfn "$DOTFILES/.config/kitty" "$HOME/.config/kitty"
ln -sfn "$DOTFILES/.config/opencode" "$HOME/.config/opencode"
ln -sfn "$DOTFILES/.config/rofi" "$HOME/.config/rofi"
ln -sfn "$DOTFILES/.config/waybar" "$HOME/.config/waybar"
ln -sfn "$DOTFILES/.config/qt6ct" "$HOME/.config/qt6ct"
ln -sfn "$DOTFILES/.config/Kvantum" "$HOME/.config/Kvantum"


# Shell

ln -sf "$DOTFILES/.zprofile" "$HOME/.zprofile"
ln -sf "$DOTFILES/.zshrc" "$HOME/.zshrc"


# Success!

echo "Symlinks created!"

