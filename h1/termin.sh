#!/bin/bash

# Install Terminator
sudo pacman -S terminator

# Check if .config directory exists, if not create it
if [ ! -d "$HOME/.config" ]; then
    mkdir -p "$HOME/.config"
fi

# Copy Terminator configuration to .config directory
cp -r "$HOME/.config/terminator" "$HOME/.config/"