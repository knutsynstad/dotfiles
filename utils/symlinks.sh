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

# Create config directories if needed
mkdir -p ~/.config


#  █ █ █▄█ █▀█ █▀█ █   ▄▀█ █▄ █ █▀▄
#  █▀█  █  █▀▀ █▀▄ █▄▄ █▀█ █ ▀█ █▄▀

mkdir -p ~/.config/hypr
ln -sf ~/dotfiles/.config/hypr/hyprland.conf ~/.config/hypr/hyprland.conf
ln -sf ~/dotfiles/.config/hypr/hyprpaper.conf ~/.config/hypr/hyprpaper.conf



#  █▀█ █▀█ █▀▀ █ ▄▄ █ █ █ ▄▀█ █▄█ █   ▄▀█ █▄ █ █▀▄
#  █▀▄ █▄█ █▀  █    ▀▄▀▄▀ █▀█  █  █▄▄ █▀█ █ ▀█ █▄▀

mkdir -p ~/.config/rofi
ln -sf ~/dotfiles/.config/rofi/config.rasi ~/.config/rofi/config.rasi
ln -sf ~/dotfiles/.config/rofi/theme.rasi ~/.config/rofi/theme.rasi


#  █▄▀ █ ▀█▀ ▀█▀ █▄█
#  █ █ █  █   █   █ 

mkdir -p ~/.config/kitty
ln -sf ~/dotfiles/.config/kitty/kitty.conf ~/.config/kitty/kitty.conf


#  █ █ █ ▄▀█ █▄█ █▄▄ ▄▀█ █▀█
#  ▀▄▀▄▀ █▀█  █  █▄█ █▀█ █▀▄

mkdir -p ~/.config/waybar
ln -sf ~/dotfiles/.config/waybar/config.jsonc ~/.config/waybar/config.jsonc
ln -sf ~/dotfiles/.config/waybar/style.css ~/.config/waybar/style.css

mkdir -p ~/.config/waybar/scripts
ln -sf ~/dotfiles/.config/waybar/scripts/spotify-metadata.sh ~/.config/waybar/scripts/spotify-metadata.sh
ln -sf ~/dotfiles/.config/waybar/scripts/spotify-launch.sh ~/.config/waybar/scripts/spotify-launch.sh


# various apps
mkdir -p ~/.local
mkdir -p ~/.local/share
mkdir -p ~/.local/share/applications
ln -sf ~/dotfiles/.local/share/applications/steam.desktop ~/.local/share/applications/steam.desktop
ln -sf ~/dotfiles/.local/share/applications/discord.desktop ~/.local/share/applications/discord.desktop
ln -sf ~/dotfiles/.local/share/applications/1password.desktop ~/.local/share/applications/1password.desktop
ln -sf ~/dotfiles/.local/share/applications/firefox.desktop ~/.local/share/applications/firefox.desktop
ln -sf ~/dotfiles/.local/share/applications/gimp.desktop ~/.local/share/applications/gimp.desktop
ln -sf ~/dotfiles/.local/share/applications/scribus.desktop ~/.local/share/applications/scribus.desktop
ln -sf ~/dotfiles/.local/share/applications/spotify.desktop ~/.local/share/applications/spotify.desktop



#  █▀ █ █ █▀▀ █   █
#  ▄█ █▀█ ██▄ █▄▄ █▄▄

ln -sf ~/dotfiles/.zprofile ~/.zprofile
ln -sf ~/dotfiles/.zshrc ~/.zshrc

echo "Symlinks created!"
