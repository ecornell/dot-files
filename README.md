# Dotfiles

Personal dotfiles for bash, tmux, and development tools.

## Quick Install

```bash
git clone git@github.com:ecornell/dot-files.git ~/.dot-files
cd ~/.dot-files
./install.sh
```

## What's Included

### Bash Configuration (.bashrc)
- Custom colorized prompt (green user@host, blue directory)
- Enhanced history management (10k in memory, 20k on disk)
- Navigation aliases (`..`, `...`, `....`)
- Safety aliases (confirm before `rm`, `cp`, `mv`)
- Colorized `ls` and `grep` output
- Git shortcuts (`gs`, `ga`, `gc`, `gp`, `gl`, `gd`)
- Utility functions:
  - `mkcd` - make and cd into directory
  - `extract` - extract any archive type
  - `ff` / `fd` - find files/directories by name
  - `backup` - create timestamped backup of file
  - `path` - display PATH entries one per line

### Profile (.profile)
- Sources `.bashrc` for bash login shells
- Ensures consistent environment across shell types

### Tmux Configuration (.tmux.conf)
- Vim-style navigation and copy mode
- Mouse support enabled
- Custom key bindings for pane management
- Enhanced status bar
- 50k history limit
- Optimized for PowerShell/Windows Terminal compatibility

## Manual Installation

If you prefer to set up manually:

```bash
# Clone the repository
git clone git@github.com:ecornell/dot-files.git ~/.dot-files

# Create symlinks
ln -s ~/.dot-files/.bashrc ~/.bashrc
ln -s ~/.dot-files/.profile ~/.profile
ln -s ~/.dot-files/.tmux.conf ~/.tmux.conf

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

## Features by File

### .bashrc
- **History**: Ignores duplicates, simple commands, and commands starting with space
- **Aliases**: 25+ shortcuts for common tasks
- **Functions**: 6 utility functions for everyday tasks
- **Prompt**: `user@host:~/current/path$` format with colors

### .tmux.conf
- **Prefix**: `Ctrl+a` (instead of `Ctrl+b`)
- **Splits**: `|` for horizontal, `_` for vertical
- **Navigation**: `h/j/k/l` for vim-style pane switching
- **Resize**: `H/J/K/L` for vim-style pane resizing
- **Copy mode**: Vim-style keybindings

## Dependencies

Required:
- bash
- git
- tmux

Optional:
- chruby (for Ruby version management)
- curl (for `myip` alias)

## Customization

To add machine-specific settings that shouldn't be version controlled:

```bash
# Create a local bashrc file
touch ~/.bashrc.local

# Add to .bashrc:
if [ -f ~/.bashrc.local ]; then
    source ~/.bashrc.local
fi
```

## License

MIT
