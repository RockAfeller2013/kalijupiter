#!/bin/bash
# echo kali | sudo -S curl -sL https://raw.githubusercontent.com/RockAfeller2013/kalijupiter/main/install2.sh | bash

# Update the system
echo "Updating system..."
sudo apt update && sudo apt upgrade -y

# Install Tools
sudo apt-get install -y crackmapexec nmap nbtscan enum4linux samba-common-bin smbclient enum4linux enum4linux-ng krb5-user python3-impacket impacket-scripts

# Install Basics
echo "Installing basics..."
sudo apt-get install -y zip certbot python3-pip python3-venv zip certbot screen jupyter-notebook
sudo apt-get install awscli -y

# Install Jupyter and Dependencies
echo "Installing Jupyter and dependencies..."
pip3 install --break-system-packages jupyter pandas openpyxl bash_kernel 
pip3 install --upgrade --force jupyter-console
sudo python3 -m bash_kernel.install
# python3 -m bash_kernel.install --user

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
cp notebook.ipynb /home/kali/
jupyter-notebook --allow-root  /home/kali/notebook.ipynb  --notebook-dir /home/kali  
