#!/bin/bash

# Install Waybar on Arch Linux
sudo pacman -S waybar

# Check if the installation was successful
if [ $? -ne 0 ]; then
    echo "Error: Failed to install Waybar. Exiting."
    exit 1
fi

# Create the .config directory if it doesn't exist
mkdir -p ~/.config/waybar

# Copy the default configuration file to the .config directory
cp /etc/xdg/waybar/config ~/.config/waybar/config

# Check if the copy was successful
if [ $? -ne 0 ]; then
    echo "Error: Failed to copy Waybar configuration. Exiting."
    exit 1
fi

# Create a systemd service for Waybar
sudo tee /etc/systemd/system/waybar.service > /dev/null <<EOT
[Unit]
Description=Waybar Customization
After=network.target

[Service]
Type=simple
ExecStart=/usr/bin/waybar

[Install]
WantedBy=default.target
EOT

# Enable and start the Waybar service
sudo systemctl enable waybar.service
sudo systemctl start waybar.service

# Check if the service was enabled successfully
if [ $? -ne 0 ]; then
    echo "Error: Failed to enable Waybar service. Exiting."
    exit 1
fi

echo "Waybar installation and configuration completed successfully. Waybar will start at system startup."
