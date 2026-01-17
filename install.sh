#!/bin/bash
# Dotfiles installation script
# This script creates symlinks from home directory to dotfiles in ~/.dot-files

set -e

# Colors for output
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m' # No Color

# Get the directory where this script is located
DOTFILES_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
BACKUP_DIR="$HOME/.dotfiles-backup-$(date +%Y%m%d-%H%M%S)"

echo -e "${GREEN}Installing dotfiles from $DOTFILES_DIR${NC}"

# List of files to symlink
FILES=(
    ".bashrc"
    ".profile"
    ".tmux.conf"
    ".zshrc"
    ".gitignore_global"
    ".gvimrc.after"
    ".hgignore_global"
    ".hgrc"
    ".todo.cfg"
)

# Create backup directory if we need it
create_backup_dir() {
    if [ ! -d "$BACKUP_DIR" ]; then
        mkdir -p "$BACKUP_DIR"
        echo -e "${YELLOW}Created backup directory: $BACKUP_DIR${NC}"
    fi
}

# Function to backup a file
backup_file() {
    local file=$1
    create_backup_dir
    mv "$HOME/$file" "$BACKUP_DIR/$file"
    echo -e "${YELLOW}  Backed up existing $file to $BACKUP_DIR${NC}"
}

# Function to create symlink
create_symlink() {
    local file=$1
    local source="$DOTFILES_DIR/$file"
    local target="$HOME/$file"

    # Skip if source doesn't exist
    if [ ! -f "$source" ]; then
        echo -e "${YELLOW}  Skipping $file (not found in dotfiles)${NC}"
        return
    fi

    # If target exists and is not a symlink, back it up
    if [ -e "$target" ] && [ ! -L "$target" ]; then
        backup_file "$file"
    fi

    # If target is already a correct symlink, skip
    if [ -L "$target" ] && [ "$(readlink "$target")" = "$source" ]; then
        echo -e "${GREEN}  ✓ $file already linked${NC}"
        return
    fi

    # Remove existing symlink if it points elsewhere
    if [ -L "$target" ]; then
        rm "$target"
        echo -e "${YELLOW}  Removed old symlink for $file${NC}"
    fi

    # Create the symlink
    ln -s "$source" "$target"
    echo -e "${GREEN}  ✓ Linked $file${NC}"
}

# Install dotfiles
echo ""
echo "Creating symlinks..."
for file in "${FILES[@]}"; do
    create_symlink "$file"
done

# Check for required dependencies
echo ""
echo "Checking dependencies..."

check_command() {
    if command -v "$1" &> /dev/null; then
        echo -e "${GREEN}  ✓ $1 installed${NC}"
    else
        echo -e "${RED}  ✗ $1 not found${NC}"
    fi
}

check_command "git"
check_command "tmux"
check_command "curl"

# Check for chruby
if [ -f "/usr/local/share/chruby/chruby.sh" ]; then
    echo -e "${GREEN}  ✓ chruby installed${NC}"
else
    echo -e "${YELLOW}  ! chruby not found (optional for Ruby development)${NC}"
fi

echo ""
echo -e "${GREEN}Installation complete!${NC}"
echo ""
echo "To apply bash changes, run:"
echo "  source ~/.bashrc"
echo ""
echo "To apply tmux changes:"
echo "  tmux source-file ~/.tmux.conf"
echo ""

if [ -d "$BACKUP_DIR" ]; then
    echo -e "${YELLOW}Backup of old files saved to: $BACKUP_DIR${NC}"
fi
