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
mkdir -p "$HOME/.local/share/applications"


# Config directories

ln -sfn "$DOTFILES/.config/hypr" "$HOME/.config/hypr"
ln -sfn "$DOTFILES/.config/kitty" "$HOME/.config/kitty"
ln -sfn "$DOTFILES/.config/opencode" "$HOME/.config/opencode"
ln -sfn "$DOTFILES/.config/rofi" "$HOME/.config/rofi"
ln -sfn "$DOTFILES/.config/waybar" "$HOME/.config/waybar"
ln -sfn "$DOTFILES/.config/qt6ct" "$HOME/.config/qt6ct"
ln -sfn "$DOTFILES/.config/Kvantum" "$HOME/.config/Kvantum"

# Application launchers

ln -sf "$DOTFILES/.local/share/applications/steam.desktop" \
  "$HOME/.local/share/applications/steam.desktop"

ln -sf "$DOTFILES/.local/share/applications/discord.desktop" \
  "$HOME/.local/share/applications/discord.desktop"

ln -sf "$DOTFILES/.local/share/applications/1password.desktop" \
  "$HOME/.local/share/applications/1password.desktop"

ln -sf "$DOTFILES/.local/share/applications/firefox.desktop" \
  "$HOME/.local/share/applications/firefox.desktop"

ln -sf "$DOTFILES/.local/share/applications/gimp.desktop" \
  "$HOME/.local/share/applications/gimp.desktop"

ln -sf "$DOTFILES/.local/share/applications/scribus.desktop" \
  "$HOME/.local/share/applications/scribus.desktop"

ln -sf "$DOTFILES/.local/share/applications/spotify.desktop" \
  "$HOME/.local/share/applications/spotify.desktop"


# Shell

ln -sf "$DOTFILES/.zprofile" "$HOME/.zprofile"
ln -sf "$DOTFILES/.zshrc" "$HOME/.zshrc"


# Success!

echo "Symlinks created!"

