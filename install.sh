#!/bin/bash
# Jupyter Install
# echo kali | sudo -S curl -sL https://raw.githubusercontent.com/RockAfeller2013/kalijupiter/main/install.sh | bash


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
sudo apt install -y python3-pip python3-venv zip certbot
pip3 install --break-system-packages jupyter pandas openpyxl bash_kernel 
python3 -m bash_kernel.install

# Verify Installation

jupyter --version
python3 -c "import pandas; print(pandas.__version__)"
python3 -c "import openpyxl; print(openpyxl.__version__)"
jupyter kernelspec list


# Setyp Jupiter
mkdir /root/.jupyter/ssl
openssl req -new -newkey rsa:4096 -days 365 -nodes -x509 -subj "/C=COUNTRY/ST=STATE/L=CITY/O=ORGANIZATION/CN=CNAME" -keyout /root/.jupyter/ssl/mykey.key -out /root/.jupyter/ssl/mycert.pem
screen -dmS notebook jupyter-notebook --allow-root --notebook-dir /root/.jupyter

# sudo apt update && sudo apt install jupyter-notebook -y

sudo wget -O notebook.ipynb "https://raw.githubusercontent.com/obheda12/JupyterPen/refs/heads/main/OSINT/Jupyter_OSINT.ipynb" && sudo jupyter-notebook --allow-root notebook.ipynb
