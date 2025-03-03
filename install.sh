#!/bin/bash
# Jupyter Install
# sudo curl -sL https://raw.githubusercontent.com/RockAfeller2013/kalijupiter/main/install.sh | bash


#Update System
echo Updating Apt!
sudo apt-get -qq -y update

#Install Basics
sudo apt-get install -qq -y zip certbot python3-pip
pip3 install awscli -q


#Install Python PIP
#echo Installing Python PIP!
#wget -q https://bootstrap.pypa.io/get-pip.py -O get-pip.py
#sudo python get-pip.py
#rm get-pip.py

#Install Juypter
echo Installing Jupyter!
pip3 install jupyter -q
pip3 install --upgrade --force jupyter-console -q
pip3 install pandas -q
pip3 install openpyxl -q
pip3 install bash_kernel -q
python3 -m bash_kernel.install
mkdir /root/.jupyter/ssl
openssl req -new -newkey rsa:4096 -days 365 -nodes -x509 -subj "/C=COUNTRY/ST=STATE/L=CITY/O=ORGANIZATION/CN=CNAME" -keyout /root/.jupyter/ssl/mykey.key -out /root/.jupyter/ssl/mycert.pem
screen -dmS notebook jupyter-notebook --allow-root --notebook-dir /root/.jupyter

# sudo apt update && sudo apt install jupyter-notebook -y

sudo wget -O notebook.ipynb "https://raw.githubusercontent.com/obheda12/JupyterPen/refs/heads/main/OSINT/Jupyter_OSINT.ipynb" && sudo jupyter-notebook --allow-root notebook.ipynb
