#!/bin/bash

# Install VLC
sudo pacman -S vlc

# Check if .config directory exists, if not create it
if [ ! -d "$HOME/.config" ]; then
    mkdir -p "$HOME/.config"
fi
