#!/bin/bash

# Create config directories if needed
mkdir -p ~/.config

# Symlink configs
ln -sf ~/dotfiles/.config/hypr ~/.config/hypr
ln -sf ~/dotfiles/.config/waybar ~/.config/waybar
ln -sf ~/dotfiles/.zshrc ~/.zshrc
