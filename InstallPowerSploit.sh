#!/bin/bash

# Update the system
echo "Updating system..."
sudo apt update && sudo apt upgrade -y

# Install required dependencies
echo "Installing dependencies..."
sudo apt install -y wget apt-transport-https software-properties-common

# Add Microsoft's repository
echo "Adding Microsoft's repository..."
wget -q https://packages.microsoft.com/config/ubuntu/$(lsb_release -rs)/packages-microsoft-prod.deb
sudo dpkg -i packages-microsoft-prod.deb

# Update package list
echo "Updating package list..."
sudo apt update

# Install PowerShell
echo "Installing PowerShell..."
sudo apt install -y powershell

# Verify installation
echo "Verifying installation..."
pwsh --version

# Optional: Remove Microsoft repository
# echo "Removing Microsoft repository..."
# sudo rm /etc/apt/sources.list.d/microsoft-prod.list
# sudo apt update

echo "PowerShell installation complete!"

# Install PowerSpoilt
# https://www.stationx.net/how-to-use-powersploit/
# https://neil-fox.github.io/PowerSploit-usage-&-detection/
git clone https://github.com/PowerShellMafia/PowerSploit.gi
