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
- **Mouse Support**: Enabled for clicking, scrolling, and resizing
- **History**: 50k scrollback buffer
- **Status Bar**: Clean, informative status line
- **PowerShell Compatible**: Optimized escape-time for Windows Terminal

### Tmux Wrapper (tmux-wrapper)
- Filters PowerShell OSC sequences for Windows Terminal compatibility
- Automatically used when tmux is invoked via the alias in `.bashrc`
- Prevents terminal rendering issues on Windows systems

### Tmux Cheatsheet (tmux-cheatsheet.md)
- Comprehensive reference for all custom tmux keybindings
- Accessible in tmux with `Prefix ?` (Ctrl+a then ?)
- Organized by category: sessions, windows, panes, copy mode

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

# Install tmux-wrapper
mkdir -p ~/.local/bin
ln -s ~/.dot-files/tmux-wrapper ~/.local/bin/tmux-wrapper
chmod +x ~/.dot-files/tmux-wrapper

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
├── tmux-wrapper         # PowerShell OSC sequence filter
├── tmux-cheatsheet.md   # Tmux keybinding reference
├── install.sh           # Automated installation script
├── README.md            # This file
└── archived/            # Deprecated configs (zsh, vim, hg, etc.)
```

## License

MIT
