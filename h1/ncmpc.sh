#!/bin/bash

# Install ncmpc
sudo pacman -S ncmpc

# Check if .config directory exists, if not create it
if [ ! -d "$HOME/.config" ]; then
    mkdir -p "$HOME/.config"
fi

# Copy ncmpc configuration to .config directory
cp -r /usr/share/ncmpc "$HOME/.config/"
