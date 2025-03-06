#!/bin/bash

# Update the system
echo "Updating system..."
sudo apt update && sudo apt upgrade -y

# Install Tools
echo "Installing tools..."
sudo apt-get install -y crackmapexec nmap nbtscan enum4linux samba-common-bin smbclient enum4linux-ng

# Install Basics
echo "Installing basics..."
sudo apt-get install -y zip certbot python3-pip python3-venv screen awscli

# Install Jupyter and Dependencies
echo "Installing Jupyter and dependencies..."
pip3 install --user jupyter pandas openpyxl bash_kernel jupyter-console

# Install Jupyter Bash Kernel
echo "Installing Jupyter Bash Kernel..."
python3 -m bash_kernel.install --user

# Verify Installation
echo "Verifying installation..."
jupyter --version
python3 -c "import pandas; print(pandas.__version__)"
python3 -c "import openpyxl; print(openpyxl.__version__)"
jupyter kernelspec list

# Setup Jupyter SSL
echo "Setting up Jupyter SSL..."
mkdir -p ~/.jupyter/ssl
openssl req -new -newkey rsa:4096 -days 365 -nodes -x509 \
  -subj "/C=COUNTRY/ST=STATE/L=CITY/O=ORGANIZATION/CN=CNAME" \
  -keyout ~/.jupyter/ssl/mykey.key \
  -out ~/.jupyter/ssl/mycert.pem

# Download Notebook
echo "Downloading notebook..."
wget -O ~/notebook.ipynb "https://raw.githubusercontent.com/RockAfeller2013/kalijupiter/main/notebook.ipynb"

# Start Jupyter Notebook
echo "Starting Jupyter Notebook..."
jupyter-notebook --notebook-dir ~/ --no-browser --ip=0.0.0.0 --port=8888
