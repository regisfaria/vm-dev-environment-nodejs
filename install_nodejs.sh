#!/bin/bash
echo "Installing NodeJS"
curl -fsSL https://deb.nodesource.com/setup_14.x | sudo -E bash -
sudo apt-get install -y nodejs
sudo npm install --global yarn