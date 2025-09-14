#!/bin/bash
set -e

# Run as part of the container setup
# Install other stuff that the container requires

# Update and install all apt packages in one command
apt update && apt upgrade -y && apt install -y \
    gh \
    vim \
    postgresql-client \
    mysql-client \
    screen \
    tmux \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Install Goose CLI
curl -fsSL https://github.com/pressly/goose/releases/latest/download/goose_linux_x86_64 -o /usr/local/bin/goose
chmod +x /usr/local/bin/goose

# Install pyinfo
curl -s https://raw.githubusercontent.com/jvrck/pyinfo/master/install | bash

# Install update-ai-tools script
cp /app/update-ai-tools /usr/local/bin/update-ai-tools
chmod +x /usr/local/bin/update-ai-tools

# Install uv (Python package manager) system-wide
curl -LsSf https://astral.sh/uv/install.sh | sh
# Move to system-wide location so all users can access it
mv /root/.local/bin/uv /usr/local/bin/uv 2>/dev/null || true
mv /root/.local/bin/uvx /usr/local/bin/uvx 2>/dev/null || true
chmod +x /usr/local/bin/uv /usr/local/bin/uvx 2>/dev/null || true

# Anything that requires npm or nodejs should be done here.
source /usr/local/share/nvm/nvm.sh

# Create vscode user home directory if it doesn't exist
mkdir -p /home/vscode

# Fix npm global package permissions for the vscode user (UID 1000)
# This allows the user to upgrade global packages without permission issues
npm config set prefix /home/vscode/.npm-global
mkdir -p /home/vscode/.npm-global
chown -R 1000:1000 /home/vscode/.npm-global

# Add npm global bin to PATH for vscode user
touch /home/vscode/.bashrc /home/vscode/.zshrc
echo 'export PATH=/home/vscode/.npm-global/bin:$PATH' >> /home/vscode/.bashrc
echo 'export PATH=/home/vscode/.npm-global/bin:$PATH' >> /home/vscode/.zshrc

# Install global npm packages
export PATH=/home/vscode/.npm-global/bin:$PATH
npm install -g \
    @devcontainers/cli \
    @anthropic-ai/claude-code \
    @google/gemini-cli \
    @openai/codex \
    repomix \
    ccusage \
    claude-code-router \
    @qwen-code/qwen-code@latest

# Create and ensure vscode user owns the npm cache (if it exists)
mkdir -p /home/vscode/.npm
chown -R 1000:1000 /home/vscode/.npm
# Also ensure vscode owns their home directory
chown -R 1000:1000 /home/vscode