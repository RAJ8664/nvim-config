#!/bin/bash

GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m'

echo -e "${GREEN}Starting Neovim configuration installation...${NC}"

# --- Backup existing Neovim configuration ---
NVIM_CONFIG_DIR="$HOME/.config/nvim"
if [ -d "$NVIM_CONFIG_DIR" ]; then
    echo -e "${YELLOW}Existing Neovim configuration found at $NVIM_CONFIG_DIR.${NC}"
    echo -e "${YELLOW}Backing it up to ${NVIM_CONFIG_DIR}.bak...${NC}"
    # Remove old backup if it exists
    if [ -d "${NVIM_CONFIG_DIR}.bak" ]; then
        rm -rf "${NVIM_CONFIG_DIR}.bak"
    fi
    mv "$NVIM_CONFIG_DIR" "${NVIM_CONFIG_DIR}.bak"
fi

echo -e "${GREEN}Creating new Neovim configuration directory...${NC}"
mkdir -p "$NVIM_CONFIG_DIR"

# --- Copy configuration files ---
echo -e "${GREEN}Copying configuration files...${NC}"
rsync -av --progress . "$NVIM_CONFIG_DIR" --exclude ".git" --exclude "install.sh" --exclude "README.md"

echo -e "${GREEN}Checking for dependencies...${NC}"

command_exists() {
    command -v "$1" >/dev/null 2>&1
}

for cmd in git curl unzip; do
    if ! command_exists $cmd; then
        echo -e "${YELLOW}Dependency '$cmd' not found. Please install it using your system's package manager.${NC}"
        echo -e "${YELLOW}(e.g., sudo apt-get install $cmd, sudo pacman -S $cmd, brew install $cmd)${NC}"
    fi
done

for cmd in rg fd; do
    if ! command_exists $cmd; then
        echo -e "${YELLOW}Recommended dependency '$cmd' not found. Some features might not work correctly.${NC}"
        echo -e "${YELLOW}You can install it with your package manager (e.g., ripgrep, fd-find).${NC}"
    fi
done

if ! command_exists gcc && ! command_exists clang; then
    echo -e "${YELLOW}A C compiler (gcc or clang) is not found. nvim-treesitter might fail to install parsers.${NC}"
    echo -e "${YELLOW}Please install build-essential, base-devel, or Xcode Command Line Tools.${NC}"
fi

echo -e "${GREEN}Installing Neovim plugins using lazy.nvim...${NC}"
echo -e "${GREEN}This might take a few minutes...${NC}"

nvim --headless "+Lazy! sync" +qa

echo -e "\n${GREEN}=======================================${NC}"
echo -e "${GREEN}  Neovim configuration installed!  ${NC}"
echo -e "${GREEN}=======================================${NC}"
echo -e "Please restart Neovim for the changes to take effect."
