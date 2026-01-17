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

# List of dotfiles to symlink to home directory
DOTFILES=(
    ".bashrc"
    ".profile"
    ".tmux.conf"
    ".gitignore_global"
)

# Additional files to symlink to home directory
SUPPORT_FILES=(
    "tmux-cheatsheet.md"
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
echo "Creating symlinks for dotfiles..."
for file in "${DOTFILES[@]}"; do
    create_symlink "$file"
done

echo ""
echo "Creating symlinks for support files..."
for file in "${SUPPORT_FILES[@]}"; do
    create_symlink "$file"
done

# Install tmux-wrapper to ~/.local/bin
echo ""
echo "Installing tmux-wrapper..."
WRAPPER_SOURCE="$DOTFILES_DIR/tmux-wrapper"
WRAPPER_TARGET="$HOME/.local/bin/tmux-wrapper"

if [ ! -d "$HOME/.local/bin" ]; then
    mkdir -p "$HOME/.local/bin"
    echo -e "${YELLOW}  Created $HOME/.local/bin directory${NC}"
fi

if [ -L "$WRAPPER_TARGET" ] && [ "$(readlink "$WRAPPER_TARGET")" = "$WRAPPER_SOURCE" ]; then
    echo -e "${GREEN}  ✓ tmux-wrapper already linked${NC}"
elif [ -e "$WRAPPER_TARGET" ] && [ ! -L "$WRAPPER_TARGET" ]; then
    backup_file ".local/bin/tmux-wrapper"
    ln -s "$WRAPPER_SOURCE" "$WRAPPER_TARGET"
    echo -e "${GREEN}  ✓ Linked tmux-wrapper${NC}"
elif [ -L "$WRAPPER_TARGET" ]; then
    rm "$WRAPPER_TARGET"
    ln -s "$WRAPPER_SOURCE" "$WRAPPER_TARGET"
    echo -e "${GREEN}  ✓ Linked tmux-wrapper${NC}"
else
    ln -s "$WRAPPER_SOURCE" "$WRAPPER_TARGET"
    echo -e "${GREEN}  ✓ Linked tmux-wrapper${NC}"
fi

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

echo ""
echo -e "${GREEN}Installation complete!${NC}"
echo ""
echo "Next steps:"
echo "  1. Apply bash changes:"
echo "     source ~/.bashrc"
echo ""
echo "  2. Ensure ~/.local/bin is in your PATH (already configured in .bashrc)"
echo ""
echo "  3. Apply tmux changes (if tmux is running):"
echo "     tmux source-file ~/.tmux.conf"
echo ""
echo "  4. View tmux cheatsheet anytime with:"
echo "     Prefix ? (where Prefix is Ctrl+a)"
echo ""

if [ -d "$BACKUP_DIR" ]; then
    echo -e "${YELLOW}Backup of old files saved to: $BACKUP_DIR${NC}"
fi
