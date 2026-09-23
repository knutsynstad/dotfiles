#!/bin/bash

set -e

echo "Setting desktop preferences ..."

# Prefer dark mode for applications that follow the system color scheme.
gsettings set org.gnome.desktop.interface color-scheme 'prefer-dark'

echo "Desktop preferences configured!"
