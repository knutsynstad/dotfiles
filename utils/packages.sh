#!/bin/bash


#  ██████╗  █████╗  █████╗ ██╗  ██╗ █████╗  ██████╗ ███████╗ ██████╗
#  ██╔══██╗██╔══██╗██╔══██╗██║ ██╔╝██╔══██╗██╔════╝ ██╔════╝██╔════╝
#  ██████╔╝███████║██║  ╚═╝█████═╝ ███████║██║  ██╗ █████╗  ╚█████╗
#  ██╔═══╝ ██╔══██║██║  ██╗██╔═██╗ ██╔══██║██║  ╚██╗██╔══╝   ╚═══██╗
#  ██║     ██║  ██║╚█████╔╝██║ ╚██╗██║  ██║╚██████╔╝███████╗██████╔╝
#  ╚═╝     ╚═╝  ╚═╝ ╚════╝ ╚═╝  ╚═╝╚═╝  ╚═╝ ╚═════╝ ╚══════╝╚═════╝


# Exit immediately if something fails
set -e

# Prevent running as root
if [ "$EUID" -eq 0 ]; then
  echo "Do NOT run this script as root."
  exit 1
fi

echo "Updating system before installing packages..."
sudo pacman -Syu --noconfirm

echo "Installing packages ..."


#  █▀▀ █▀█ █▀█ █▀▀   █ █ ▀█▀ █ █   █ ▀█▀ █ █▀▀ █▀
#  █▄▄ █▄█ █▀▄ ██▄   █▄█  █  █ █▄▄ █  █  █ ██▄ ▄█

sudo pacman -S --noconfirm --needed zsh unzip

# Install Oh My Zsh
if [ ! -d "$HOME/.oh-my-zsh" ]; then
  export RUNZSH=no       # Don't start Zsh after install
  export CHSH=no         # Don't change the shell (yet)
  export KEEP_ZSHRC=yes  # Don't overwrite .zshrc
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
else
  echo "Oh My Zsh already installed. Skipping..."
fi


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
hyprland hyprpaper wl-clipboard grim slurp mako waybar rofi-wayland \
xdg-desktop-portal-hyprland qt5-wayland qt6-wayland qt5ct qt6ct \
polkit-kde-agent kvantum xdg-utils xorg-xwayland


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

if ! command -v yay &> /dev/null; then
  echo "yay not found, installing..."
  cd /tmp
  git clone https://aur.archlinux.org/yay.git
  cd yay
  makepkg -si --noconfirm
fi


#  ▄▀█ █ █ █▀█   █▀█ ▄▀█ █▀▀ █▄▀ ▄▀█ █▀▀ █▀▀ █▀
#  █▀█ █▄█ █▀▄   █▀▀ █▀█ █▄▄ █ █ █▀█ █▄█ ██▄ ▄█

yay -S --noconfirm --needed \
1password spotify


# Change default shell to Zsh if not already set
if [ "$SHELL" != "/bin/zsh" ]; then
  echo "Setting Zsh as the default shell..."
  chsh -s /bin/zsh
else
  echo "Zsh is already the default shell."
fi

echo "Done installing packages!"
