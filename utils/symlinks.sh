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


#  █▄▀ █ ▀█▀ ▀█▀ █▄█
#  █ █ █  █   █   █ 

mkdir -p ~/.config/kitty
ln -sf ~/dotfiles/.config/kitty/kitty.conf ~/.config/kitty/kitty.conf


#  █ █ █ ▄▀█ █▄█ █▄▄ ▄▀█ █▀█
#  ▀▄▀▄▀ █▀█  █  █▄█ █▀█ █▀▄

mkdir -p ~/.config/waybar
ln -sf ~/dotfiles/.config/waybar/config.jsonc ~/.config/waybar/config.jsonc
ln -sf ~/dotfiles/.config/waybar/style.css ~/.config/waybar/style.css


#  █▀ █ █ █▀▀ █   █
#  ▄█ █▀█ ██▄ █▄▄ █▄▄

ln -sf ~/dotfiles/.zprofile ~/.zprofile
ln -sf ~/dotfiles/.zshrc ~/.zshrc

echo "Symlinks created!"
