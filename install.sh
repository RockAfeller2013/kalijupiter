#!/bin/bash
# sudo curl -sL https://raw.githubusercontent.com/RockAfeller2013/kalijupiter/main/install.sh | bash
sudo apt update && sudo apt install jupyter-notebook -y
pip install bash_kernel
python3 -m bash_kernel.install
wget -O notebook.ipynb "https://raw.githubusercontent.com/obheda12/JupyterPen/refs/heads/main/OSINT/Jupyter_OSINT.ipynb" && jupyter-notebook notebook.ipynb
