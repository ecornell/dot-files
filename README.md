# Dotfiles

Personal dotfiles for bash and tmux on Linux systems.

## Quick Install

```bash
git clone git@github.com:ecornell/dot-files.git ~/.dot-files
cd ~/.dot-files
./install.sh
```

## What's Included

### Bash Configuration (.bashrc)
- **Custom Prompt**: Colorized prompt (green user@host, blue directory)
- **History Management**: Enhanced history (10k in memory, 20k on disk, deduplication)
- **Navigation Aliases**: `..`, `...`, `....` for quick directory traversal
- **Safety Aliases**: Interactive confirmations for `rm`, `cp`, `mv`
- **Colorized Output**: Auto-color for `ls` and `grep`
- **Git Shortcuts**: `gs`, `ga`, `gc`, `gp`, `gl`, `gd`
- **Utility Functions**:
  - `mkcd` - create directory and cd into it
  - `extract` - universal archive extractor (tar, zip, 7z, etc.)
  - `ff` / `fd` - find files/directories by name
  - `backup` - create timestamped backup of file
  - `path` - display PATH entries one per line

### Profile (.profile)
- Sources `.bashrc` for bash login shells
- Ensures consistent environment across shell types

### Tmux Configuration (.tmux.conf)
- **Prefix Key**: `Ctrl+a` (instead of default `Ctrl+b`)
- **Navigation**: Vim-style pane navigation (`h/j/k/l`)
- **Resizing**: Vim-style pane resizing (`H/J/K/L`)
- **Splits**: `|` for horizontal, `_` for vertical
- **Copy Mode**: Vim keybindings (`v` select, `y` yank)
- **Clipboard**: OSC 52 support for copying to system clipboard (even over SSH)
- **Mouse Support**: Enabled for clicking, scrolling, and resizing
- **History**: 50k scrollback buffer
- **Status Bar**: Clean, informative status line
- **Escape Time**: Optimized at 35ms for compatibility

### Tmux Cheatsheet (tmux-cheatsheet.md)
- Comprehensive reference for all custom tmux keybindings
- Accessible in tmux with `Prefix ?` (Ctrl+a then ?)
- Organized by category: sessions, windows, panes, copy mode

### Tmux Clipboard (tmux-clipboard)
- OSC 52 clipboard integration script
- Enables copying from tmux to system clipboard over SSH
- Works with modern terminals that support OSC 52 (iTerm2, Windows Terminal, etc.)

### Git Ignore (.gitignore_global)
- Global git ignore patterns
- Excludes common temporary files, OS files, and build artifacts

## Manual Installation

If you prefer to set up manually:

```bash
# Clone the repository
git clone git@github.com:ecornell/dot-files.git ~/.dot-files

# Create symlinks for dotfiles
ln -s ~/.dot-files/.bashrc ~/.bashrc
ln -s ~/.dot-files/.profile ~/.profile
ln -s ~/.dot-files/.tmux.conf ~/.tmux.conf
ln -s ~/.dot-files/.gitignore_global ~/.gitignore_global
ln -s ~/.dot-files/tmux-cheatsheet.md ~/tmux-cheatsheet.md

# Apply changes
source ~/.bashrc
```

## Updating

To pull latest changes:

```bash
cd ~/.dot-files
git pull
source ~/.bashrc  # Apply bash changes
tmux source-file ~/.tmux.conf  # Apply tmux changes
```

## Key Features

### Quick Access
- **Git Status**: `gs`
- **Git Add**: `ga`
- **Git Commit**: `gc`
- **Navigate Up**: `..`, `...`, `....`
- **Disk Usage**: `ducks` (show largest directories)
- **Process Search**: `psg <name>`
- **My IP**: `myip`

### Tmux Key Bindings
- **Prefix**: `Ctrl+a`
- **New Split**: `|` (horizontal), `_` (vertical)
- **Navigate Panes**: `h/j/k/l` (vim-style)
- **Resize Panes**: `H/J/K/L` (vim-style)
- **Cycle Panes**: `Ctrl+a Ctrl+a`
- **Reload Config**: `Ctrl+a r`
- **Show Cheatsheet**: `Ctrl+a ?`
- **Sync Panes**: `Ctrl+a S` (type in all panes at once)

## Dependencies

Required:
- bash
- git
- tmux

Optional:
- curl (for `myip` alias)
- Various archive tools for `extract` function (tar, unzip, 7z, etc.)

## Customization

To add machine-specific settings that shouldn't be version controlled, create a `~/.bashrc.local` file:

```bash
# Create a local bashrc file
touch ~/.bashrc.local

# Add your machine-specific settings
echo 'export MY_CUSTOM_VAR="value"' >> ~/.bashrc.local
```

The `.bashrc` will automatically source this file if it exists.

## Files Overview

```
.dot-files/
├── .bashrc              # Bash configuration and aliases
├── .profile             # Login shell configuration
├── .tmux.conf           # Tmux configuration
├── .gitignore_global    # Global git ignore patterns
├── tmux-cheatsheet.md   # Tmux keybinding reference
├── tmux-clipboard       # OSC 52 clipboard integration script
├── install.sh           # Automated installation script
├── README.md            # This file
├── tmux-wrapper         # (Optional) PowerShell OSC filter for Windows Terminal
└── archived/            # Deprecated configs (zsh, vim, hg, etc.)
```

## License

MIT
