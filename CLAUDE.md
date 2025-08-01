# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

**Version:** 3.0.0  
**Last Updated:** 2025-08-01  
**Author:** Reina MacCredy

---

## 🏗️ Repository Architecture

This is a **GNU Stow-based modular dotfiles system** for macOS development environments. Each tool's configuration is isolated in its own directory that mirrors the target filesystem structure, enabling selective deployment via symlinks.

### Core Design Pattern
```
~/.dotfiles/
├── tool-name/
│   └── .config/
│       └── tool-name/
│           ├── config.toml
│           └── scripts/
└── brew/Brewfile (centralized package management)
```

**Key Architectural Principles:**
- **Modular Configuration**: Each tool independently manageable via `stow tool-name`
- **XDG Compliance**: All configs use `~/.config/` structure
- **Event-Driven Integration**: Tools communicate via callbacks and environment variables
- **Security-First**: No hardcoded secrets, comprehensive .gitignore, audit history
- **Workspace-Constrained**: Deliberately limited to 5 workspaces for productivity

---

## 🛠️ Essential Commands

### Configuration Management
```bash
# Apply specific tool configuration
stow tool-name

# Remove tool configuration  
stow -D tool-name

# Preview changes without applying
stow -n tool-name

# Apply core system (recommended order)
stow zsh git aerospace sketchybar tmux cursor
```

### Package Management
```bash
# Install all packages and applications (new machine setup)
brew bundle install --file=brew/Brewfile

# Update Brewfile after adding packages
brew bundle dump --force --file=brew/Brewfile

# Standard workflow for new packages
brew install package-name
brew bundle dump --force --file=brew/Brewfile
git add brew/Brewfile && git commit -m "feat(brew): add package-name"
```

### System Service Management
```bash
# Reload AeroSpace configuration
aerospace reload-config

# Restart status bar integration
brew services restart sketchybar

# Debug window assignments
aerospace list-windows --workspace all
```

### Development Setup (New Machine)
```bash
# Automated setup via script
./setup.sh

# Manual setup (5 minutes)
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
git clone https://github.com/ReinaMacCredy/dotfiles.git ~/.dotfiles
cd ~/.dotfiles && brew bundle install --file=brew/Brewfile
stow zsh git aerospace sketchybar tmux cursor
```

---

## 🧩 Core System Architecture

### 1. Window Management System (AeroSpace + SketchyBar)

**AeroSpace Configuration** (`aerospace/.config/aerospace/aerospace.toml`):
- **i3-like tiling window manager** for macOS
- **Critical Integration**: `exec-on-workspace-change` triggers SketchyBar updates
- **Event Variables**: `AEROSPACE_FOCUSED_WORKSPACE`, `AEROSPACE_PREV_WORKSPACE`
- **Workspace Constraint**: Hard-limited to workspaces 1-5
- **Auto-Assignment Rules**: Apps automatically move to designated workspaces

**Key Keybind Matrix:**
```toml
# Window Focus
alt-left/right/up/down = 'focus direction'

# Window Movement  
cmd-alt-left/right/up/down = 'move direction'

# Workspace Navigation (Custom Layout)
alt-q = 'workspace 1'  # Utilities
alt-w = 'workspace 2'  # Communication
alt-1 = 'workspace 3'  # Development
alt-2 = 'workspace 4'  # Productivity  
alt-3 = 'workspace 5'  # Media

# Service Mode (Advanced Operations)
alt-shift-q = 'mode service'
```

**SketchyBar Integration** (`sketchybar/.config/sketchybar/`):
- **Event-Driven Updates**: Receives AeroSpace workspace changes via triggers
- **Modular Plugin System**: Separate scripts for different status components
- **Theme Integration**: Tokyo Night color scheme across all components

### 2. Hybrid Application Launch System

**Two-Tier Architecture:**
```bash
# Quick Access Layer (SKHD)
Left Alt + [key] → Instant app launch without workspace change

# Smart Launch Layer (AeroSpace)  
Cmd + Alt + [key] → Launch app AND switch to appropriate workspace
```

### 3. Terminal Environment (tmux + Shell)

**tmux Configuration** (`tmux/.config/tmux/tmux.conf`):
- **Popup-Heavy Workflow**: Key tools accessible as floating windows
- **Development Keybinds**:
  - `Ctrl + H` → Claude Code (popup)
  - `Ctrl + G` → Lazygit (popup)  
  - `Ctrl + F` → OpenCode (popup)
  - `Ctrl + N` → Session switcher (FZF-based)

**Shell Configuration** (`zsh/.config/zsh/`):
- **XDG-Compliant**: Uses `~/.config/zsh/` instead of `~/`
- **Loading Chain**: `.zshenv` → `.zprofile` → `.zshrc`
- **Conditional Loading**: Tools only loaded if available

### 4. Package Management System

**Brewfile-Driven** (`brew/Brewfile`):
- **97 packages** including development tools, applications, VS Code extensions
- **Service Management**: PostgreSQL 15, Redis with auto-restart
- **VS Code Integration**: Extensions automatically installed via `vscode "extension.id"`

---

## 🔌 Critical Integration Points

### AeroSpace ↔ SketchyBar Communication
```toml
# aerospace.toml
exec-on-workspace-change = [
  '/bin/bash', '-c',
  'sketchybar --trigger aerospace_workspace_change FOCUSED_WORKSPACE=$AEROSPACE_FOCUSED_WORKSPACE'
]
```

### Application Auto-Assignment Rules
```toml
# Utilities apps → workspace 1
[[on-window-detected]]
if.app-id = 'dev.warp.Warp-Stable'
run = ['layout tiling', 'move-node-to-workspace 1']

# Development apps → workspace 3
[[on-window-detected]]
if.app-id = 'com.todesktop.230313mzl4w4u92'  # Cursor
run = ['layout tiling', 'move-node-to-workspace 3']
```

### Service Mode Integration
```toml
# Enter service mode with visual feedback
alt-shift-q = [
  'mode service',
  'exec-and-forget sketchybar --trigger aerospace_service_mode_enabled_changed AEROSPACE_SERVICE_MODE_ENABLED=true'
]
```

---

## 🔧 Development Patterns

### Adding New Tool Configurations

1. **Create Directory Structure**:
```bash
mkdir -p new-tool/.config/new-tool/
```

2. **Add Configuration Files**:
```bash
# Place config files in proper XDG structure
new-tool/.config/new-tool/config.yml
```

3. **Test and Apply**:
```bash
stow -n new-tool  # Dry run
stow new-tool     # Apply
```

### Workspace Assignment for New Apps

1. **Get App Bundle ID**:
```bash
osascript -e 'id of app "App Name"'
```

2. **Add to aerospace.toml**:
```toml
[[on-window-detected]]
if.app-id = 'com.company.appname'
check-further-callbacks = true
run = ['layout tiling', 'move-node-to-workspace X']
```

3. **Reload Configuration**:
```bash
aerospace reload-config
```

### Service Management Patterns

**Status Services (Always Restart After Config Changes):**
```bash
brew services restart sketchybar
brew services restart skhd
```

**Database Services (Managed by Brewfile):**
```bash
# Defined in Brewfile with restart_service: :changed
brew "postgresql@15", restart_service: :changed
brew "redis", restart_service: :changed
```

---

## 📊 Tool Ecosystem Overview

### Core Development Stack
- **Languages**: Go, Python 3.10/3.11, Node.js (via nvm), Bun.js
- **Editors**: Neovim (Lazy.nvim), Cursor (Claude AI integration)
- **Version Control**: Git with git-lfs, Lazygit interface
- **Databases**: PostgreSQL 15, Redis (service-managed)
- **Containers**: Docker support

### System Management Layer
- **Window Manager**: AeroSpace (i3-like tiling)
- **Status Bar**: SketchyBar (custom, event-driven)
- **Input Management**: Karabiner-Elements, SKHD
- **Terminal**: WezTerm, tmux multiplexer
- **File Management**: Superfile, bat (cat replacement)

### Productivity Applications
- **Browsers**: Brave, Firefox, Dia Browser
- **Communication**: Discord, Zalo, Zoom
- **Notes**: Obsidian, Notion  
- **Media**: Spotify, VLC, YouTube Music
- **Development**: Cursor, GitHub Desktop, Postman

---

## 🔍 Troubleshooting & Debugging

### Common Issues & Solutions

**AeroSpace Not Responding:**
```bash
# Check if running
pgrep AeroSpace

# Restart service
brew services restart aerospace

# Debug window detection
aerospace list-windows --all
```

**SketchyBar Not Updating:**
```bash
# Check event triggers
tail -f /tmp/sketchybar_*.log

# Restart with debugging
brew services stop sketchybar
sketchybar --config ~/.config/sketchybar/sketchybarrc &
```

**Stow Conflicts:**
```bash
# Backup existing configs
mv ~/.config/tool ~/.config/tool.backup

# Force stow (use cautiously)
stow --adopt tool-name
```

**Service Mode Stuck:**
```bash
# Force exit service mode
aerospace mode main
```

### Configuration Validation

**Test AeroSpace Config:**
```bash
# Validate configuration syntax
aerospace validate-config ~/.config/aerospace/aerospace.toml

# Debug keybinds
aerospace list-keybinds
```

**Test Stow Deployment:**
```bash
# See what would be linked
stow -n -v tool-name

# Check for conflicts
stow -S tool-name 2>&1 | grep "already exists"
```

---

## 🔒 Security Architecture

### Repository Security Status: **SECURE** ✅

- **No Sensitive Data**: SSH configs, credentials, personal paths removed
- **Git History Clean**: 179 commits rewritten to purge sensitive data  
- **Public-Safe Design**: Safe for public sharing and contribution
- **Automated Protection**: Comprehensive .gitignore prevents future exposure

### Security Features
- **XDG Compliance**: Configuration isolation from sensitive directories
- **Environment Variable Usage**: No hardcoded secrets or paths
- **Audit Trail**: Security audit report available for reference
- **Permission Management**: Proper SSH key permissions via setup script

---

## 🎯 Key Success Factors

1. **Modular Design**: Each tool independently manageable via stow
2. **Event-Driven Integration**: Tools communicate seamlessly via callbacks
3. **Productivity Optimization**: 5-workspace constraint, efficient keybinds
4. **Automation**: One-command setup for new machines via setup.sh
5. **Security Conscious**: Designed for safe public sharing
6. **Well Documented**: Comprehensive troubleshooting and architecture docs

This architecture demonstrates a production-ready dotfiles system balancing functionality, security, and maintainability through thoughtful modular design and comprehensive automation.