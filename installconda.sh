# Install Anaconda
# The command sudo apt install -y anaconda will not work in Kali Linux because Anaconda is not available in the default APT repositories.
# https://www.anaconda.com/docs/getting-started/anaconda/install#macos-linux-installation
sudo curl -O https://repo.anaconda.com/archive/Anaconda3-2024.10-1-Linux-x86_64.sh
echo yes | sudo bash Anaconda3-2024.10-1-Linux-x86_64.sh -b -p $HOME/anaconda3

# Replace <PATH_TO_CONDA> with the path to your conda install
source /home/kali/anaconda3/bin/activate
conda init --all
conda config --set auto_activate_base True
which conda

# bash anaconda.sh -b -p $HOME/anaconda3
echo 'export PATH="$HOME/anaconda3/bin:$PATH"' >> ~/.bashrc
source ~/.bashrc
anaconda-navigator
conda --version
conda init

echo y | conda create -n myenvironment python numpy pandas pytorch
conda info --envs
conda activate
conda activate myenvironment 
conda install -c anaconda jupyter
jupyter notebook
