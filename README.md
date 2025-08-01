# 🏠 Dotfiles

Personal dotfiles configuration for macOS with AeroSpace window management.

## 🚀 Installation

```bash
# Install Homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Clone dotfiles
git clone https://github.com/ReinaMacCredy/dotfiles.git ~/.dotfiles
cd ~/.dotfiles

# Install packages and apply configurations
brew bundle install --file=brew/Brewfile
stow zsh git aerospace sketchybar tmux cursor
```

## ⌨️ Key Shortcuts

**Workspace Navigation:**
- `Option + Q/W/1/2/3` - Switch to workspace 1-5
- `Option + Shift + E/W/1/2/3` - Move window to workspace

**Window Management:**
- `Option + Arrow Keys` - Focus window
- `Cmd + Option + Arrow Keys` - Move window
- `Option + Shift + P` - Toggle layout
- `Option + \`` - Toggle floating

## 🏗️ Workspace Layout

- **Workspace 1**: Utilities (Browser)
- **Workspace 2**: Communication (Discord, Zalo)
- **Workspace 3**: Development (Terminal, Cursor, GitHub)
- **Workspace 4**: Productivity (Notion, Obsidian)
- **Workspace 5**: Media (Spotify, VLC)

## 🔧 Management

```bash
# Apply configuration
stow tool-name

# Remove configuration
stow -D tool-name

# Reload AeroSpace
aerospace reload-config
```