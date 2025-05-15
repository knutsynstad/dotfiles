#!/bin/bash

#
#  ██╗███╗  ██╗ ██████╗████████╗ █████╗ ██╗     ██╗
#  ██║████╗ ██║██╔════╝╚══██╔══╝██╔══██╗██║     ██║
#  ██║██╔██╗██║╚█████╗    ██║   ███████║██║     ██║
#  ██║██║╚████║ ╚═══██╗   ██║   ██╔══██║██║     ██║
#  ██║██║ ╚███║██████╔╝   ██║   ██║  ██║███████╗███████╗
#  ╚═╝╚═╝  ╚══╝╚═════╝    ╚═╝   ╚═╝  ╚═╝╚══════╝╚══════╝
#  ██╗████████╗     █████╗ ██╗     ██╗     ██╗
#  ██║╚══██╔══╝    ██╔══██╗██║     ██║     ██║
#  ██║   ██║       ███████║██║     ██║     ██║
#  ██║   ██║       ██╔══██║██║     ██║     ╚═╝
#  ██║   ██║       ██║  ██║███████╗███████╗██╗
#  ╚═╝   ╚═╝       ╚═╝  ╚═╝╚══════╝╚══════╝╚═╝
#

set -e
# exit immediately if something fails

echo "Installing packages ..."


#  █▀▀ █▀█ █▀█ █▀▀   █ █ ▀█▀ █ █   █ ▀█▀ █ █▀▀ █▀
#  █▄▄ █▄█ █▀▄ ██▄   █▄█  █  █ █▄▄ █  █  █ ██▄ ▄█

sudo pacman -S --noconfirm --needed unzip


#  █▄ █ █▀▀ ▀█▀ █ █ █ █▀█ █▀█ █▄▀ █ █▄ █ █▀▀
#  █ ▀█ ██▄  █  ▀▄▀▄▀ █▄█ █▀▄ █ █ █ █ ▀█ █▄█

sudo pacman -S --noconfirm --needed \
networkmanager network-manager-applet iwd wireless_tools


#  █▀▀ █▀█ █ █    ▄▀  █ █ █ █▀▄ █▀▀ █▀█
#  █▄█ █▀▀ █▄█  ▄▀    ▀▄▀ █ █▄▀ ██▄ █▄█

sudo pacman -S --noconfirm --needed \
nvidia lib32-nvidia-utils nvidia-settings libva-nvidia-driver \
lib32-vulkan-icd-loader vulkan-tools


#  █ █ █ ▄▀█ █▄█ █   ▄▀█ █▄ █ █▀▄    ▄▀  █ █ █▄█ █▀█ █▀█ █   ▄▀█ █▄ █ █▀▄
#  ▀▄▀▄▀ █▀█  █  █▄▄ █▀█ █ ▀█ █▄▀  ▄▀    █▀█  █  █▀▀ █▀▄ █▄▄ █▀█ █ ▀█ █▄▀

sudo pacman -S --noconfirm --needed \
hyprland hyprpaper wl-clipboard grim slurp mako waybar wofi \
xdg-desktop-portal-hyprland qt5-wayland qt6-wayland qt5ct qt6ct \
polkit-kde-agent kvantum xdg-utils xwayland


#  ▄▀█ █ █ █▀▄ █ █▀█
#  █▀█ █▄█ █▄▀ █ █▄█

sudo pacman -S --noconfirm --needed pavucontrol


#  █▀▀ █▀█ █▄ █ ▀█▀ █▀
#  █▀  █▄█ █ ▀█  █  ▄█

sudo pacman -S --noconfirm --needed \
ttf-jetbrains-mono-nerd inter-font otf-font-awesome


#  █▀▄ █▀▀ █▀ █▄▀ ▀█▀ █▀█ █▀█   ▄▀█ █▀█ █▀█ █▀
#  █▄▀ ██▄ ▄█ █ █  █  █▄█ █▀▀   █▀█ █▀▀ █▀▀ ▄█

sudo pacman -S --noconfirm --needed \
firefox discord obs-studio nautilus kitty gimp inkscape \
scribus steam


#  ▄▀█ █ █ █▀█   █ █ █▀▀ █   █▀█ █▀▀ █▀█
#  █▀█ █▄█ █▀▄   █▀█ ██▄ █▄▄ █▀▀ ██▄ █▀▄

sudo pacman -S --noconfirm --needed yay yay-debug


#  ▄▀█ █ █ █▀█   █▀█ ▄▀█ █▀▀ █▄▀ ▄▀█ █▀▀ █▀▀ █▀
#  █▀█ █▄█ █▀▄   █▀▀ █▀█ █▄▄ █ █ █▀█ █▄█ ██▄ ▄█

yay -S --noconfirm --needed \
1password spotify


echo "Done installing packages!"
