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
npm install -g @devcontainers/cli
# install claude-code
npm install -g @anthropic-ai/claude-code
# install gemini-cli
npm install -g @google/gemini-cli
# install repomix
npm install -g repomix
# CCUage
npm install -g ccusage