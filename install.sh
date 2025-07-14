#!/bin/bash

set -e

# Colors for output
GREEN="\033[0;32m"
YELLOW="\033[1;33m"
RED="\033[0;31m"
RESET="\033[0m"

echo -e "${YELLOW}📦 Starting Neovim configuration installation...${RESET}"

# Check if nvim is installed
if ! command -v nvim &> /dev/null
then
    echo -e "${RED}❌ Neovim is not installed. Please install Neovim first.${RESET}"
    exit 1
fi

# Define paths
NVIM_CONFIG_DIR="$HOME/.config/nvim"
BACKUP_DIR="$HOME/.config/nvim_backup_$(date +%s)"
CURRENT_DIR=$(pwd)

# Backup existing config if exists
if [ -d "$NVIM_CONFIG_DIR" ]; then
    echo -e "${YELLOW}⚠️ Found existing Neovim config. Backing up to ${BACKUP_DIR}${RESET}"
    mv "$NVIM_CONFIG_DIR" "$BACKUP_DIR"
fi

# Copy config to ~/.config/nvim
echo -e "${GREEN}📁 Copying Neovim config to ${NVIM_CONFIG_DIR}${RESET}"
mkdir -p "$HOME/.config"
cp -r "$CURRENT_DIR" "$NVIM_CONFIG_DIR"

# Install plugins (assuming lazy.nvim or similar is used)
echo -e "${GREEN}⚙️ Installing Neovim plugins...${RESET}"
nvim --headless "+Lazy! sync" +qa || true

echo -e "${GREEN}✅ Installation complete! Launch Neovim and enjoy your setup.${RESET}"
