#!/bin/bash
# Jupyter Install
# echo kali | sudo -S curl -sL https://raw.githubusercontent.com/RockAfeller2013/kalijupiter/main/install.sh | bash

# Update the system
echo "Updating system..."
sudo apt update && sudo apt upgrade -y

# Tools 
sudo apt-get install -y crackmapexec nmap nbtscan enum4linux samba-common-bin smbclient enum4linux  enum4linux-ng

#Install Basics
sudo apt-get install -y zip certbot python3-pip python3-venv zip certbot screen jupyter-notebook
sudo apt-get install awscli -y

#Install Juypter
pip3 install --break-system-packages jupyter pandas openpyxl bash_kernel 
pip3 install --upgrade --force jupyter-console
sudo python3 -m bash_kernel.install

# Verify Installation
jupyter --version
python3 -c "import pandas; print(pandas.__version__)"
python3 -c "import openpyxl; print(openpyxl.__version__)"
jupyter kernelspec list

# Setup Jupiter
sudo mkdir /root/.jupyter/ssl
sudo openssl req -new -newkey rsa:4096 -days 365 -nodes -x509 -subj "/C=COUNTRY/ST=STATE/L=CITY/O=ORGANIZATION/CN=CNAME" -keyout /root/.jupyter/ssl/mykey.key -out /root/.jupyter/ssl/mycert.pem

sudo wget -O notebook.ipynb "https://raw.githubusercontent.com/RockAfeller2013/kalijupiter/refs/heads/main/notebook.ipynb" 
cp notebook.ipynb /home/kali/
jupyter-notebook --allow-root  /home/kali/notebook.ipynb  --notebook-dir /home/kali  
