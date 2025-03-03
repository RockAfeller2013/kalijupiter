# curl -s https://ludus.cloud/install.sh | bash
sudo apt update && sudo apt install jupyter-notebook -y
pip install bash_kernel
python3 -m bash_kernel.install
jupyter-notebook
