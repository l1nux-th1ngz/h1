#!/bin/bash

# Install MPV
sudo pacman -S mpv

# Check if .config directory exists, if not create it
if [ ! -d "$HOME/.config" ]; then
    mkdir -p "$HOME/.config"
fi

# Copy MPV configuration to .config directory
cp -r /etc/mpv "$HOME/.config/"
