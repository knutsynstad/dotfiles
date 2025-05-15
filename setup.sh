#!/bin/bash

# 1. Install required packages
./install.sh

# 2. Set up config symlinks
./symlink.sh

# 3. Set up environment variables (optional)
source ./env.sh

# 4. Done
echo "✅ Setup complete. You might want to restart your shell or Hyprland."
