# Tmux Cheatsheet

## Prefix Key
- **Ctrl+a** (custom, default is Ctrl+b)

## Sessions
- `tmux` - Start new session
- `tmux new -s name` - Start named session
- `tmux ls` - List sessions
- `tmux attach -t name` - Attach to named session
- `Prefix d` - Detach from session

## Windows
- `Prefix c` - Create new window
- `Prefix ,` - Rename current window
- `Prefix &` - Close current window
- `Prefix n` - Next window
- `Prefix p` - Previous window
- `Prefix 0-9` - Switch to window by number
- `Prefix w` - List windows
- `Alt+h` - Previous window (custom)
- `Alt+l` - Next window (custom)
- `Prefix X` - Kill window (with confirmation)

## Panes
### Creating Panes
- `Prefix |` - Split horizontally (custom)
- `Prefix _` - Split vertically (custom)

### Navigation
- `Prefix h` - Move to left pane (vim-style)
- `Prefix j` - Move to down pane (vim-style)
- `Prefix k` - Move to up pane (vim-style)
- `Prefix l` - Move to right pane (vim-style)
- `Prefix Ctrl+a` - Cycle through panes

### Resizing
- `Prefix H` - Resize pane left by 10 (vim-style)
- `Prefix J` - Resize pane down by 10 (vim-style)
- `Prefix K` - Resize pane up by 10 (vim-style)
- `Prefix L` - Resize pane right by 10 (vim-style)

### Managing Panes
- `Prefix Ctrl+x` - Kill current pane
- `Prefix z` - Toggle pane zoom (fullscreen)
- `Prefix {` - Move pane left
- `Prefix }` - Move pane right
- `Prefix !` - Break pane into new window
- `Prefix Ctrl+[` - Join pane from (interactive)
- `Prefix Ctrl+]` - Send pane to (interactive)
- `Prefix S` - Toggle synchronize-panes (type in all panes at once)

## Copy Mode (Vim-style)
- `Prefix [` - Enter copy mode
- `v` - Begin selection
- `y` - Copy selection and exit
- `r` - Toggle rectangle selection
- `q` - Exit copy mode
- Use vim navigation keys: `h`, `j`, `k`, `l`, `w`, `b`, `$`, `^`, `gg`, `G`

## Other
- `Prefix ?` - Show this cheatsheet
- `Prefix r` - Reload tmux config
- `Prefix t` - Show clock
- `Prefix m` - Toggle activity monitoring
- `Prefix :` - Enter command mode

## Mouse Support
- Click to select pane
- Click window name in status bar to switch
- Drag pane border to resize
- Drag to select text in copy mode
- Right-click to paste

## Tips
- All custom bindings use **Ctrl+a** as prefix (not Ctrl+b)
- Vim navigation throughout (h/j/k/l)
- Status bar shows session name (left) and time/date (right)
- 50,000 line scrollback buffer
- Auto-renumber windows when one is closed
