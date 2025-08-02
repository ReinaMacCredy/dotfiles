# 🏠 Dotfiles

Modern macOS development environment with AeroSpace window management and Claude Code integration.

## 🚀 Quick Setup (New Machine)

```bash
# Clone and run automated setup
git clone https://github.com/ReinaMacCredy/dotfiles.git ~/.dotfiles
cd ~/.dotfiles
./setup.sh
```

**What setup.sh does:**
- ✅ Installs Homebrew if needed
- ✅ Installs all packages from Brewfile  
- ✅ Applies ALL configurations via GNU Stow
- ✅ Sets up Claude Code configuration with sanitized paths
- ✅ Configures SSH keys and proper permissions
- ✅ Starts necessary system services
- ✅ Handles conflicts intelligently (backs up existing configs)

## Manual Installation (Advanced)

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

**Quick Access Layer:**
- `Option + Z` - Zalo (instant launch)
- More shortcuts available in AeroSpace config

**Workspace Navigation:**
- `Option + Q/W/1/2/3` - Switch to workspace 1-5  
- `Option + Shift + E/W/1/2/3` - Move window to workspace

**Smart Launch Layer:**
- `Cmd + Option + A` - Dia Browser → Workspace 1
- `Cmd + Option + S` - Zalo → Workspace 2
- `Cmd + Option + T` - Terminal → Workspace 3
- `Cmd + Option + C` - Cursor → Workspace 3

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

## 🔧 Configuration Management

```bash
# Apply specific configuration
stow tool-name

# Remove specific configuration
stow -D tool-name

# Reload AeroSpace configuration
aerospace reload-config

# Backup Claude Code config (run periodically)
~/backup-claude-config.sh
```

## 🤖 Claude Code Integration

This dotfiles setup includes **automated Claude Code configuration**:

**✅ What's Included:**
- Custom agents and slash commands
- MCP server configurations  
- User preferences and workflow settings
- Development environment integration

**🔄 Setup Process:**
1. `./setup.sh` automatically copies and sanitizes Claude config
2. Replaces hardcoded paths with dynamic variables (`$HOME`)
3. Removes personal information for security
4. Ready to use immediately after setup

**📝 Post-Setup:**
- Update `~/.claude/CLAUDE.md` with your personal information
- Configure API keys in `~/.claude/settings.local.json` if needed
- Customize agent definitions and commands as needed

**🔐 Security:**
- Personal information sanitized during setup
- Hardcoded paths replaced with environment variables
- API keys and tokens excluded from backup
- Safe for public repository sharing