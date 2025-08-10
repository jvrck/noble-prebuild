#!/bin/bash

# Run as part of the container setup
# Install other stuff that the container rquires

# Update and install some basic tools
apt update && apt upgrade -y
apt install gh -y
apt install vim -y

# Install posgresql client
apt install postgresql-client -y

# Install mysql client
apt install mysql-client -y

# Install pyinfo
curl -s https://raw.githubusercontent.com/jvrck/pyinfo/master/install | sudo bash

# Anything that requires npm or nodejs should be done here.
source /usr/local/share/nvm/nvm.sh

# Fix npm global package permissions for the vscode user (UID 1000)
# This allows the user to upgrade global packages without permission issues
npm config set prefix /home/vscode/.npm-global
mkdir -p /home/vscode/.npm-global
chown -R 1000:1000 /home/vscode/.npm-global

# Add npm global bin to PATH for vscode user
echo 'export PATH=/home/vscode/.npm-global/bin:$PATH' >> /home/vscode/.bashrc
echo 'export PATH=/home/vscode/.npm-global/bin:$PATH' >> /home/vscode/.zshrc

# Install global npm packages
export PATH=/home/vscode/.npm-global/bin:$PATH
npm install -g @devcontainers/cli
# install claude-code
npm install -g @anthropic-ai/claude-code
# install gemini-cli
npm install -g @google/gemini-cli
# install repomix
npm install -g repomix
# CCUage
npm install -g ccusage

# Ensure vscode user owns the npm cache
chown -R 1000:1000 /home/vscode/.npm