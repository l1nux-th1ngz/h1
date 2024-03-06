#!/bin/bash

# Install required Bluetooth packages
sudo pacman -S bluez bluez-tools bluez-utils blueman

# Enable Bluetooth service
sudo systemctl enable bluetooth.service
sleep 3

# Start Bluetooth service
sudo systemctl start bluetooth.service
sleep 3
