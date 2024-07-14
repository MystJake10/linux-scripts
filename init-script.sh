#!/bin/bash

# Update package lists
sudo apt update && sudo apt upgrade -y

# Install Brave browser
echo "APT: Installing Brave browser..."
sudo apt install -y brave-browser

# Install Visual Studio Code
echo "SNAP: Installing Visual Studio Code..."
sudo snap install --classic code

# Install Steam
echo "APT: Installing Steam..."
sudo apt install -y steam

# Install Jellyfin
echo "FLAT: Installing Jellyfin..."
flatpak install flathub com.github.iwalton3.jellyfin-media-player

# Install net-tools (assuming net-utils was meant to be net-tools)
echo "APT: Installing net-tools..."
sudo apt install -y net-tools

# Install Yubico Authenticator
echo "APT: Installing Yubico Authenticator..."
sudo apt install -y yubioath-desktop

# Install VLC media player
echo "APT: Installing VLC media player..."
sudo apt install -y vlc

echo "APT: Installing HTOP..."
sudo apt install -y htop

# Print completion message
echo "Installation completed."

# Enable dark mode (assuming GNOME)
echo "Configuring Settings..."
gsettings set org.gnome.desktop.interface color-scheme 'prefer-dark'

# Install Oh-my-zsh
sudo sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended

# Uninstall other web browsers
sudo apt remove firefox chromium-browser --purge