#!/bin/bash

# Update package lists
sudo apt update
sudo apt upgrade -y

# Prerequisites
echo "Installing prerequisites..."
sudo apt install -y \
    curl \
    jq \
    wget \
    gnome-shell-extensions \

sudo curl -fsSLo /usr/share/keyrings/brave-browser-archive-keyring.gpg https://brave-browser-apt-release.s3.brave.com/brave-browser-archive-keyring.gpg

echo "deb [signed-by=/usr/share/keyrings/brave-browser-archive-keyring.gpg] https://brave-browser-apt-release.s3.brave.com/ stable main"|sudo tee /etc/apt/sources.list.d/brave-browser-release.list

chmod +x install-gnome-extensions.sh

# Software installation
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
flatpak install -y flathub com.github.iwalton3.jellyfin-media-player

# Install OhMyZsh
echo "Installing OhMyZsh..."
sudo sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended

# Print completion message
echo "Installation completed."

echo "Configuring Settings..."

# Enable dark mode (assuming GNOME)
gsettings set org.gnome.desktop.interface color-scheme 'prefer-dark'

# Disable configure mouse
gsettings set org.gnome.desktop.peripherals.mouse accel-profile "flat"
gsettings set org.gnome.desktop.peripherals.mouse natural-scroll false
gsettings set org.gnome.desktop.peripherals.mouse speed 0.0735

# Allow volume above 100%
gsettings set org.gnome.desktop.sound allow-volume-above-100-percent true

# Set default web browser
xdg-settings set default-web-browser brave-browser.desktop

# Set gnome-shell extensions configuration
dconf load /org/gnome/shell/extensions/ < extensions.dconf

# Set custom keyboard shortcuts
dconf load /org/gnome/settings-daemon/plugins/media-keys/ < shortcuts.dconf

# Set Diodon configuration
dconf load /net/launchpad/diodon/ < diodon.dconf

# Uninstall other web browsers
sudo apt remove firefox chromium-browser --purge -y

# Stage Zsh config and theme
mv .zshrc ~/
mv kali-like.zsh-theme ~/.oh-my-zsh/themes/

# Install and enable extensions
./install-gnome-extensions.sh --enable --file extenstions.csv

echo "Done!"