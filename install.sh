# sudo curl -s https://github.com/RockAfeller2013/kalijupiter/blob/main/install.sh | bash
# sudo curl -sL https://raw.githubusercontent.com/RockAfeller2013/kalijupiter/main/install.sh | bash
sudo apt update && sudo apt install jupyter-notebook -y
pip install bash_kernel
python3 -m bash_kernel.install
jupyter-notebook
