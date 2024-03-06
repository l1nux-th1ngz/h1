#!/bin/bash

# Install Kitty
sudo pacman -S kitty

# Check if .config directory exists, if not create it
if [ ! -d "$HOME/.config" ]; then
    mkdir -p "$HOME/.config"
fi

# Copy Kitty configuration to .config directory
cp -r "$HOME/.config/kitty" "$HOME/.config/"