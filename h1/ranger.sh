#!/bin/bash

# Install Ranger
sudo pacman -S ranger

# Check if .config directory exists, if not create it
if [ ! -d "$HOME/.config" ]; then
    mkdir -p "$HOME/.config"
fi

# Copy Ranger configuration to .config directory
cp -r /etc/ranger "$HOME/.config/"
