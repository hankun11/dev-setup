#!/usr/bin/env bash

# ~/pydata.sh

# Removed user's cached credentials
# This script might be run with .dots, which uses elevated privileges
sudo -K

# Check to see if conda is installed.
  
# Installs anaconda according to my customizations
function install_conda {
  # bash miniconda.sh -p $HOME/miniconda
  # rm miniconda.sh
  # export PATH=$HOME/miniconda/bin:$PATH

  bash ~/miniconda3/miniconda.sh -b -u -p ~/miniconda3
  rm -rf ~/miniconda3/miniconda.sh


#   # Install basic data science stack into default environment
#   conda install --yes pandas scipy numpy matplotlib seaborn jupyter ipykernel nodejs

#   jupyter notebook --generate-config
  # We are done at this point, move on.
  echo "miniconda successfully installed. moving on..."
}

echo "checking to see if conda is installed."
which -s conda
if [[ $? != 0 ]]; then
    echo "conda not installed; installing miniconda now..."
    # wget https://repo.anaconda.com/miniconda/Miniconda3-latest-MacOSX-x86_64.sh -O miniconda.sh
    mkdir -p ~/miniconda3
    curl https://repo.anaconda.com/miniconda/Miniconda3-latest-MacOSX-arm64.sh -o ~/miniconda3/miniconda.sh
    # wget https://repo.anaconda.com/miniconda/Miniconda3-latest-MacOSX-arm64.sh -O miniconda.sh
    install_conda
else
    echo "conda already installed. moving on..."
fi

# # Install pip
# easy_install pip


###############################################################################
# Python 3 Virtual Enviroment                                                 #
###############################################################################

echo "------------------------------"
echo "Setting up python 3.10 virtual environment."

# # Create a Python2 data environment
# mkvirtualenv py2-data
# workon py2-data

conda create -n py310 python=3.10
conda activate py310
# Install Python data modules
pip install numpy
pip install scipy
pip install matplotlib
pip install pandas
# pip install seaborn
pip install scikit-learn
# pip install jupyterlab
