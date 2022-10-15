#!/bin/bash
#------------------------------------------------------------
# install-docker.sh - Script para instalação do Docker Engine
#
# Autor: Ian Nascimento
#------------------------------------------------------------

# Set default distribution id
distribution_id="debian"

#-----------------------
# Uninstall old versions
#-----------------------
sudo apt-get remove docker docker-engine docker.io containerd runc

#----------------------
# Set up the repository
#----------------------

# Update the apt package index and install packages to allow apt to use a repository over HTTPS:
sudo apt-get update
sudo apt-get install -y \
    ca-certificates \
    curl \
    gnupg \
    lsb-release

# Get distribution ID
if [ -f /etc/os-release ]
then
    distribution_id=$(grep "^ID=" /etc/os-release | cut -d"=" -f2)
fi

# Add Docker’s official GPG key:
sudo mkdir -p /etc/apt/keyrings
sudo curl -fsSL https://download.docker.com/linux/${distribution_id}/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg

# Set up the repository
sudo echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/${distribution_id} \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

#----------------------
# Install Docker Engine
#----------------------
sudo apt-get update
sudo apt-get install -y docker-ce docker-ce-cli containerd.io