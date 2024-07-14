#!/bin/bash

# Update package lists
sudo apt update 
sudo apt upgrade -y

# Prerequisites
echo "Installing prerequisites..."
sudo apt install -y \
    curl

sudo curl -fsSLo /usr/share/keyrings/brave-browser-archive-keyring.gpg https://brave-browser-apt-release.s3.brave.com/brave-browser-archive-keyring.gpg

echo "deb [signed-by=/usr/share/keyrings/brave-browser-archive-keyring.gpg] https://brave-browser-apt-release.s3.brave.com/ stable main"|sudo tee /etc/apt/sources.list.d/brave-browser-release.list

echo "Installing APT packages..."
sudo apt install -y \
    git \
    build-essential \
    cmake \
    automake \
    libtool \
    autoconf \
    gnome-shell-extension-manager \
    gir1.2-gtop-2.0 \
    lm-sensors \
    brave-browser \
    steam \
    net-tools \
    yubioath-desktop \
    vlc \
    htop

sudo apt update


echo "Installing Snap packages..."
sudo snap install --classic code

# Install Jellyfin
echo "Installing Flatpak packages..."
flatpak install flathub com.github.iwalton3.jellyfin-media-player

# Install OhMyZsh
echo "Installing OhMyZsh..."
sudo sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended

# Print completion message
echo "Installation completed."

echo "Configuring Settings..."

# Enable dark mode (assuming GNOME)
gsettings set org.gnome.desktop.interface color-scheme 'prefer-dark'

# Disable mouse acceleration
gsettings set org.gnome.desktop.peripherals.mouse accel-profile "flat"

# Set default web browser
xdg-settings set default-web-browser brave-browser.desktop

# Uninstall other web browsers
sudo apt remove firefox chromium-browser --purge -y

# Stage Zsh config and theme
mv .zshrc ~/
mv kali-like.zsh-theme ~/.oh-my-zsh/themes/

echo "Done!"