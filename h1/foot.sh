#!/bin/bash

# Install Foot
sudo pacman -S foot

# Check if .config directory exists, if not create it
if [ ! -d "$HOME/.config" ]; then
    mkdir -p "$HOME/.config"
fi

# Copy Foot configuration to .config directory
cp -r "$HOME/.config/foot" "$HOME/.config/"
