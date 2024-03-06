#!/bin/bash

# Install MPD (Music Player Daemon)
sudo pacman -S mpd

# Check if .config directory exists, if not create it
if [ ! -d "$HOME/.config" ]; then
    mkdir -p "$HOME/.config"
fi

# Copy MPD configuration to .config directory
cp -r /etc/mpd.conf "$HOME/.config/"
