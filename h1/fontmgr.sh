#!/bin/bash

# Install Font Manager
sudo pacman -S font-manager

# Check if .config directory exists, if not create it
if [ ! -d "$HOME/.config" ]; then
    mkdir -p "$HOME/.config"
fi

# Copy Font Manager configuration to .config directory
cp -r "$HOME/.config/font-manager" "$HOME/.config/"