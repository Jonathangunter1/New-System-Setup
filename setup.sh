#!/bin/bash

if [[ $EUID -ne 0 ]]; then
    echo "This script must be run with sudo or as root."
    exit 1
fi

apt update && apt upgrade -y

apt install -y chrome
apt install -y htop
apt install -y ca-certificates
apt install -y curl
apt install -y gnupg
apt install -y lsb-release
install -m 0755 -d /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
chmod a+r /etc/apt/keyrings/docker.gpg
echo   "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"   | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
apt install -y docker-ce
apt install -y docker-ce-cli
apt install -y containerd.io
apt install -y docker-buildx-plugin
apt install -y docker-compose-plugin
apt install -y keepassxc

cat bashrc_extras.txt >> ~/.bashrc

echo -e "\n#########################\nSetup Complete! \n#########################"