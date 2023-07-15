#!/bin/bash

CONDA_ENV=$1
PYTHON_VER=$2
CPU=$(uname -m)


# Installing pre
apt-get update && \
    apt-get install -y \
    python3-launchpadlib \
    vim \
    && apt update 


# Install miniconda
apt update && apt-get install -y --no-install-recommends \
    software-properties-common \
    && add-apt-repository -y ppa:deadsnakes/ppa \
    && apt update 

wget --quiet https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-${CPU}.sh -O ~/miniconda.sh \
    && /bin/bash ~/miniconda.sh -b -p /opt/conda \
    && export PATH=/opt/conda/bin:$PATH \
    && conda init bash \
    && conda install conda-build

# Set environment
. /root/.bashrc \
    && conda create -y --name $CONDA_ENV python=$PYTHON_VER 

echo "conda activate $CONDA_ENV" >> ~/.bashrc

conda activate $CONDA_ENV

# Install the Python packages
pip3 install -r requirements/requirements.txt
