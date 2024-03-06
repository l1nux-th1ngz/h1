#!/bin/bash

# Install LSD (LSDeluxe)
sudo pacman -S lsd

# Check if .config directory exists, if not create it
if [ ! -d "$HOME/.config" ]; then
    mkdir -p "$HOME/.config"
fi

# Copy lsd configuration to .config directory
cp -r "$HOME/.config/lsd" "$HOME/.config/"