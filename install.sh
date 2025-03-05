#!/bin/bash
# Jupyter Install
# echo kali | sudo -S curl -sL https://raw.githubusercontent.com/RockAfeller2013/kalijupiter/main/install.sh | bash

# Tools 
sudo apt-get install -y crackmapexec nmap nbtscan enum4linux samba-common-bin smbclient enum4linux  enum4linux-ng


#Update System
echo Updating Apt!
sudo apt-get -y update

#Install Basics
sudo apt-get install -y zip certbot python3-pip
sudo apt-get install awscli -y


#Install Python PIP
#echo Installing Python PIP!
#wget -q https://bootstrap.pypa.io/get-pip.py -O get-pip.py
#sudo python get-pip.py
#rm get-pip.py

#Install Juypter
sudo apt install -y python3-pip python3-venv zip certbot screen
pip3 install --break-system-packages jupyter pandas openpyxl bash_kernel 
sudo python3 -m bash_kernel.install

# Verify Installation

jupyter --version
python3 -c "import pandas; print(pandas.__version__)"
python3 -c "import openpyxl; print(openpyxl.__version__)"
jupyter kernelspec list


# Setyp Jupiter
sudo mkdir /root/.jupyter/ssl
sudo openssl req -new -newkey rsa:4096 -days 365 -nodes -x509 -subj "/C=COUNTRY/ST=STATE/L=CITY/O=ORGANIZATION/CN=CNAME" -keyout /root/.jupyter/ssl/mykey.key -out /root/.jupyter/ssl/mycert.pem
screen -dmS notebook jupyter-notebook --allow-root --notebook-dir /root/.jupyter

# sudo apt update && sudo apt install jupyter-notebook -y

sudo wget -O notebook.ipynb "https://raw.githubusercontent.com/obheda12/JupyterPen/refs/heads/main/OSINT/Jupyter_OSINT.ipynb" 
cp notebook.ipynb /home/kali/
jupyter-notebook --allow-root  /home/kali/notebook.ipynb  --notebook-dir /home/kali  

# Get Recon file

sudo wget -O goad.ipynb "https://raw.githubusercontent.com/RockAfeller2013/kalijupiter/refs/heads/main/GOAD.ipynb" 
cp goad.ipynb /home/kali/
jupyter-notebook --allow-root  /home/kali/goad.ipynb  --notebook-dir /home/kali  


## In order for Kali / bash command to work inside Jupiter Nootbook, Kernel | Change Kernel | Select Bash and set as default or click on the top right and select Bash.



Allow Jupyter to Run sudo Commands If you get a permission denied error, it's because Jupyter might not have the necessary permissions to run sudo commands. You can do one of the following:
Grant Sudo Permission to Your User: If you're running Jupyter as a non-root user, ensure that the user has permission to run sudo without a password. You can edit the sudoers file:
sudo visudo
Add the line (replace your-username with your actual username):

your-username ALL=(ALL) NOPASSWD: ALL
Use Jupyter with Root Privileges:
If running Jupyter as root, Nmap should work without additional permission changes.

!sudo apt install nmap -y
!sudo nmap -sP 192.168.1.0/24

------
# Use this format to run commands inside the Python3 Jypter Kernal Notebook.
import os
os.system('nmap')
------



