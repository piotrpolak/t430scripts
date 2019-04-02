#!/bin/bash

sudo apt-get update

# Docker
sudo apt-get install -y \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg-agent \
    software-properties-common
    
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
 
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu bionic stable"

sudo apt-get update
   
sudo apt-get install -y docker-ce docker-ce-cli containerd.io

sudo usermod -aG docker $USER

sudo curl -L "https://github.com/docker/compose/releases/download/1.23.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose && \
    sudo chmod +x /usr/local/bin/docker-compose && \
    sudo ln -s /usr/local/bin/docker-compose /usr/bin/docker-compose


# Chrome
wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
echo 'deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main' | sudo tee /etc/apt/sources.list.d/google-chrome.list
sudo apt-get update 
sudo apt-get install google-chrome-stable


# Prime extras
#mkdir tmp && cp tmp && git clone https://github.com/timrichardson/Prime-Ubuntu-18.04 && \
#cd Prime-Ubuntu-18.04/prime_socket/src
#sudo apt install -y rustc cargo bbswitch-dkms && \
# sudo /usr/bin/prime-select nvidia && \
# sudo make install

## Various

## Add `pepis ALL = NOPASSWD: /usr/sbin/tlp` to sudousers (sudo visudo -f /etc/sudoers)
#echo "sudo tlp start" >> ~/.bashrc

## Add `pepis ALL = NOPASSWD: /usr/bin/prime-select` to sudousers (sudo visudo -f /etc/sudoers)
