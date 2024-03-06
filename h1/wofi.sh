#!/bin/bash

# Install Wofi
sudo pacman -S wofi

# Check if .config directory exists, if not create it
if [ ! -d "$HOME/.config" ]; then
    mkdir -p "$HOME/.config"
fi

# Copy Wofi configuration to .config directory
cp /usr/share/wofi/config.example "$HOME/.config/wofi"
