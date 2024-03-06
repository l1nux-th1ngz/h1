#!/bin/bash

# Install osdlyrics
sudo pacman -S osdlyrics

# Check if .config directory exists, if not create it
if [ ! -d "$HOME/.config" ]; then
    mkdir -p "$HOME/.config"
fi

# Copy osdlyrics configuration to .config directory
cp -r /usr/share/osdlyrics "$HOME/.config/"
