# CLAUDE.md

**Version:** 2.1.3  
**Last Updated:** 2025-08-01  
**Author:** Reina MacCredy

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

---

## 📋 Version History & Changelog

### Version 2.1.3 (2025-08-01) - **LATEST**
**CRITICAL SECURITY UPDATE:**
- 🚨 **Emergency Security Cleanup**: Repository was accidentally made public with sensitive data
  - **REMOVED**: SSH configuration with production server details, IP addresses, usernames
  - **REMOVED**: Personal file paths from Claude settings
  - **REMOVED**: All backup files containing sensitive configurations
  - **ADDED**: Comprehensive .gitignore for future protection
- 🔒 **Git History Rewrite**: Completely purged sensitive data from entire repository history (179 commits)
  - Used git filter-branch to remove SSH configs, Claude settings, backup files
  - Force pushed to GitHub to ensure complete removal
  - Repository is now 100% safe for public sharing
- 📋 **Security Audit**: Generated comprehensive security audit report
  - Identified and resolved CRITICAL and HIGH severity vulnerabilities
  - Added security best practices and monitoring recommendations
- 🔧 **App Auto-Assignment Update**: Enhanced workspace organization
  - Cursor → Workspace 3 (Development apps)
  - VS Code Insiders → Workspace 3 (Development apps)
  - Reorganized workspace layout for better workflow

### Version 2.1.2 (2025-08-01) - **CONFIGURATION UPDATE**
**Recent Changes:**
- 🔧 **Custom Workspace Layout**: Implemented user-requested keybind changes
  - Workspace switching: Q=1, W=2, 1=3, 2=4, 3=5 (Option + key)
  - Move windows: E=1, W=2, 1=3, 2=4, 3=5 (Option + Shift + key)
- 🔧 **App Auto-Assignment**: Enhanced workspace rules
  - Dia Browser → Workspace 1 (auto-move + tiling)
  - Zalo & Discord → Workspace 2 (auto-move + tiling)
- 🔧 **Floating Apps**: Added media app floating rules
  - Apple Music (`com.apple.Music`) → always float
  - YouTube Music (`com.github.th-ch.youtube-music`) → always float
- 🔧 **SKHD Conflict Resolution**: Fixed keyboard shortcut conflicts
  - Disabled conflicting SKHD shortcuts for workspace switching
  - Option + S → Warp Terminal (SKHD quick launch)
  - Option + W now properly switches to Workspace 2 (AeroSpace)
- 🔧 **Floating Toggle Shortcut**: Changed from `Cmd+Shift+\` to `Option+\`` for easier access

### Version 2.1.1 (2025-08-01) - **HOTFIX**
**Issues Fixed:**
- 🔧 **AeroSpace Config Cleanup**: Fixed multiple configuration issues
  - Finder: Changed from tiling → floating (CLAUDE.md compliance)
  - Service mode: Fixed inconsistent exit triggers for all commands
  - Floating rules: Added proper rules for system utilities (Calculator, Activity Monitor, System Preferences, 1Password)
  - Media apps: Added floating rules for Spotify, VLC
  - Auto-assignment: Added workspace assignment for Zalo/Discord → workspace 2
- 🔧 **Keybind Optimization**: 
  - Quick balance: Changed hard-coded resize to smart resize
  - Removed duplicate service mode comments
- ✅ **Split Behavior**: Confirmed auto-split working with horizontal orientation

### Version 2.1 (2025-08-01)
**Changes Made:**
- ✅ **AeroSpace Keybinds**: Restored to CLAUDE.md specs after omerxx experiment
  - Focus: `Option + Arrow Keys` (reverted from vim-style)
  - Move: `Cmd + Option + Arrow Keys` 
  - Layout: `Option + Shift + P` (reverted from Alt+/)
  - Service: `Option + Shift + Q` (reverted from Alt+;)
- ✅ **tmux Configuration**: Restored original popup-heavy workflow
  - Claude popup: `Ctrl+H`, Lazygit: `Ctrl+G`, Session switcher: `Ctrl+N`
  - Removed Catppuccin theme in favor of original Tokyonight
- ✅ **System Integration**: SKHD + AeroSpace hybrid launch system maintained
- ✅ **Workspace Constraint**: Enforced 1-5 only, removed workspace 6+

**Backup Note:** Configuration backed up to `/Users/maccredyreina/.dotfiles-backup-20250801/`

### Version 2.0 (2025-08-01) - **EXPERIMENTAL PHASE**
**Changes Made:**
- 🧪 **Experimentation**: Briefly tested omerxx/dotfiles integration
  - Vim-style navigation (hjkl), Catppuccin tmux theme
  - Advanced session management with tmux-sessionx, tmux-floax
- ❌ **Reverted**: Configuration did not align with established workflow
- 📦 **Artifacts**: Backup maintained at `sketchybar-backup-linkarzu/`

### Version 1.0 (2025-07-XX) - **BASELINE**
**Initial Configuration:**
- ✅ **Core System**: AeroSpace + SketchyBar + tmux workflow established
- ✅ **Hybrid Launch**: SKHD (quick access) + AeroSpace (workspace-aware)
- ✅ **Window Management**: Simplified keybinds, 5-workspace constraint
- ✅ **Development Focus**: Popup-heavy tmux workflow for productivity

---

## 🔧 Current Configuration Specifications (v2.1)

### Core Keybind Matrix
| Function | Keybind | Status | Changed From |
|----------|---------|--------|--------------|
| **Window Focus** | `Option + Arrow Keys` | ✅ Active | N/A (Original) |
| **Window Move** | `Cmd + Option + Arrow Keys` | ✅ Active | N/A (Original) |
| **Layout Toggle** | `Option + Shift + P` | ✅ Active | `Alt + /` (v2.0) |
| **Float Toggle** | `Option + \`` | ✅ Active | `Cmd + Shift + \` (v2.1.2) |
| **Service Mode** | `Option + Shift + Q` | ✅ Active | `Alt + ;` (v2.0) |
| **Workspace Switch** | `Option + Q/W/1/2/3` | ✅ Active | Custom layout (v2.1.2) |
| **Window Move to WS** | `Option + Shift + E/W/1/2/3` | ✅ Active | Custom layout (v2.1.2) |

### Application Launch Matrix
| Category | Apps | Quick Access (SKHD) | Smart Launch (AeroSpace) |
|----------|------|-------------------|-------------------------|
| **Development** | Cursor, Warp, GitHub | `Left Alt + C/S` | `Cmd + Alt + C/T/G` → WS1 |
| **Communication** | Zalo, Discord, Zoom | `Left Alt + D` | `Cmd + Alt + S/D/Z` → WS2 |
| **Browser** | Dia, Firefox | `Left Alt + A` | `Cmd + Alt + A/F` → WS3 |
| **Productivity** | Notion, Obsidian | `Left Alt + N` | `Cmd + Alt + N/O` → WS4 |
| **Media** | Spotify, VLC | `Left Alt + M` | `Cmd + Alt + M/V` → WS5 |

### tmux Popup Workflow (v2.1)
| Tool | Popup Keybind | Split H | Split V | New Window |
|------|---------------|---------|---------|------------|
| **Claude Code** | `Ctrl + H` | `Alt + H` | `Alt + Shift + H` | `H` |
| **Lazygit** | `Ctrl + G` | `Alt + G` | `Alt + Shift + G` | `G` |
| **OpenCode** | `Ctrl + F` | `Alt + F` | `Alt + Shift + F` | `F` |
| **Session Switcher** | `Ctrl + N` | - | - | - |
| **Scratch Session** | `Ctrl + S` | - | - | `S` |
| **Custom Command** | `Ctrl + A` | `Alt + A` | `Alt + Shift + A` | `A` |

### Workspace Constraints & Rules
- **Workspace Limit**: Strictly 1-5 (no workspace 6+)
- **Monitor Assignment**: All workspaces → main monitor only
- **App Auto-Assignment**: Apps automatically move to designated workspaces
- **Floating Rules**: System utilities (Finder, Calculator, etc.) always float

### Integration Points Status
| Integration | Status | Config Location | Last Verified |
|-------------|--------|-----------------|---------------|
| **AeroSpace ↔ SketchyBar** | ✅ Active | `aerospace.toml:exec-on-workspace-change` | 2025-08-01 |
| **SKHD ↔ System** | ✅ Active | `skhd/skhdrc` | 2025-08-01 |
| **Karabiner ↔ Input** | ✅ Active | `karabiner/karabiner.json` | 2025-08-01 |
| **tmux ↔ Popups** | ✅ Active | `tmux/tmux.conf` | 2025-08-01 |

---

## Repository Architecture

This is a **modular dotfiles system** using GNU Stow for symlink management. Each tool lives in its own directory that mirrors the target filesystem structure, enabling independent configuration management.

### Core Design Patterns

**Stow-Based Organization:**
- Tool configurations in `tool/.config/tool/` structure
- `stow tool-name` creates symlinks from `~/.dotfiles/tool/` to `~/.config/tool/`
- Allows selective application/removal of configurations

**Workspace-Constrained Workflow:**
- Deliberately limited to workspaces 1-5 for focused productivity
- AeroSpace (i3-like tiling) + SketchyBar (status bar) integration
- Multi-monitor support with workspace persistence

**Event-Driven Status System:**
- AeroSpace sends workspace change events to SketchyBar via callbacks
- SketchyBar components update dynamically based on system state
- Custom plugins handle real-time content generation

## Essential Commands

### Configuration Management
```bash
# Apply a tool's configuration
stow tool-name

# Remove a tool's configuration  
stow -D tool-name

# Preview changes without applying
stow -n tool-name

# Apply all configurations
stow zsh git aerospace sketchybar tmux neovim
```

### Package Management
```bash
# Install all packages and applications (new machine setup)
brew bundle install --file=brew/Brewfile

# Update Brewfile with current installations
brew bundle dump --force --file=brew/Brewfile

# Verify current installations match Brewfile
brew bundle check --file=brew/Brewfile
```

### AeroSpace Window Management
```bash
# Reload AeroSpace configuration
aerospace reload-config

# List current windows and workspaces
aerospace list-windows
aerospace list-workspaces

# Debug AeroSpace state
aerospace debug-windows
```

### Configuration Reloading
```bash
# Reload shell configuration
source ~/.zshrc

# Restart system services
brew services restart sketchybar
brew services restart aerospace

# Reload tmux configuration (in tmux session)
tmux source-file ~/.config/tmux/tmux.conf
```

## Key Architectural Components

### AeroSpace Configuration (`aerospace/`)
- **Custom Keybinds**: Simplified ergonomic shortcuts for window management
  - Focus: `Option + Arrow Keys`
  - Move: `Cmd + Option + Arrow Keys`
  - Layout toggle: `Option + Shift + P`
  - Float toggle: `Option + \``
- **Service Mode**: Advanced window manipulation via `Option+Shift+Q`
- **Workspace Logic**: Constrained to 1-5 with simple navigation (`Option+1-5`)
- **Monitor Assignment**: All workspaces forced to main monitor only
- **Integration Points**: Callbacks to SketchyBar for status updates

### SketchyBar Setup (`sketchybar/`)
- **Event-Driven**: Receives AeroSpace workspace changes, system updates
- **Modular Components**: Separate plugins for different status elements
- **Theme System**: Consistent color/style definitions across components

### Shell Configuration (`zsh/`)
- **Multi-File Structure**: `.zshenv` → `.zprofile` → `.zshrc` loading order
- **XDG Compliance**: Uses `~/.config/zsh/` instead of `~/`
- **Tool Integration**: Conditional loading based on tool availability

### Neovim Setup (`nvim/`)
- **Lazy.nvim**: Plugin manager with lazy loading
- **Modular Plugins**: Each plugin in separate file under `lua/plugins/`
- **LSP Integration**: Mason for language server management
- **File Explorer**: nvim-tree with `F3` or `Ctrl+n` toggle keybind
- **Leader Key**: Space bar for all leader-based commands

### tmux Configuration (`tmux/`)
- **Popup-Heavy Workflow**: Tools like Claude, lazygit in floating popups
- **Development Focus**: Keybinds optimized for coding workflow
- **Path-Aware**: Smart window/pane creation based on current directory

## Critical Integration Points

### AeroSpace ↔ SketchyBar
- AeroSpace `exec-on-workspace-change` triggers SketchyBar updates
- SketchyBar workspace indicators provide click-to-switch functionality
- Service mode state synchronized between both systems

### Homebrew ↔ Git Workflow
1. Install new packages: `brew install package-name`
2. Update Brewfile: `brew bundle dump --force --file=brew/Brewfile`
3. Commit changes with descriptive message following `(scope): description` pattern

### Shell ↔ Tool Integration
- Tools added to PATH via `.zprofile` modifications
- Conditional loading prevents errors when tools unavailable
- Environment variables set in `.zshenv` for universal access

## Workflow Patterns

### New Machine Setup
1. Install Homebrew
2. Clone repository to `~/.dotfiles`
3. Run `brew bundle install --file=brew/Brewfile`
4. Apply configurations with `stow zsh git aerospace sketchybar tmux`
5. Restart shell and relevant services

### Adding New Tools
1. Create directory structure: `mkdir -p new-tool/.config/new-tool/`
2. Add configuration files in proper structure
3. Test with `stow -n new-tool` (dry run)
4. Apply with `stow new-tool`
5. Update README if significant tool

### Configuration Updates
- Direct commits for tweaks and adjustments
- Branch workflows for major changes or experiments
- Always test stow operations before committing
- Update Brewfile when adding/removing packages

## Security Considerations

### 🛡️ Repository Security Status: **SECURE** ✅

This repository has undergone comprehensive security audit and cleanup:

- **✅ No Sensitive Data**: All SSH configurations, personal paths, and sensitive files removed
- **✅ Git History Clean**: Entire git history purged of sensitive data (179 commits rewritten)
- **✅ Comprehensive .gitignore**: Prevents future accidental commits of sensitive data
- **✅ Public-Safe Design**: Repository designed for safe public sharing

### 🔒 Security Features

- **Automated Protection**: .gitignore patterns prevent SSH keys, credentials, personal files
- **XDG Compliance**: Isolates configuration from sensitive data directories
- **No Hardcoded Secrets**: All configurations use placeholders or environment variables
- **Regular Security Audits**: Security audit report available for reference

### ⚠️ Security Best Practices for Users

- **Never commit**: SSH keys, API keys, passwords, personal credentials
- **Review before push**: Always check `git status` and `git diff` before committing
- **Use .gitignore**: Ensure sensitive directories are properly ignored
- **Rotate credentials**: If sensitive data is accidentally committed, rotate immediately

### 📋 Security Audit Report

Comprehensive security audit available at: `security-audit-report.md`
- **Date**: 2025-08-01
- **Status**: All CRITICAL and HIGH vulnerabilities resolved
- **Result**: Repository safe for public sharing

## Development Context

This dotfiles system prioritizes:
- **Productivity**: Minimal workspaces, efficient keybinds, integrated tools
- **Portability**: One-command setup for new machines via Brewfile
- **Maintainability**: Modular stow packages, clear separation of concerns
- **Integration**: Tools work together (AeroSpace + SketchyBar, tmux + dev tools)
- **Security**: Safe for public sharing, follows best practices

## Hybrid Application Launch System

This configuration implements a **two-tier shortcut system** combining skhd (quick access) with AeroSpace (workspace-aware launching):

### Quick Access Layer (skhd)
**Left Alt + [key]** - Instant app launching without workspace changes:
```bash
Left Alt + S → Warp Terminal
Left Alt + A → Dia Browser  
# Left Alt + W → DISABLED (conflicts with workspace switching)
Left Alt + C → Cursor
Left Alt + F → Finder
Left Alt + M → Spotify
Left Alt + N → Notion
Left Alt + D → Discord
Left Alt + B → Alacritty
```

### Smart Launch Layer (AeroSpace)
**Cmd + Alt + [key]** - Launch app AND switch to appropriate workspace:
```bash
# Development (Workspace 1)
Cmd + Alt + C → Cursor + workspace 1
Cmd + Alt + T → Warp + workspace 1
Cmd + Alt + G → GitHub Desktop + workspace 1

# Communication (Workspace 2)
Cmd + Alt + S → Zalo + workspace 2
Cmd + Alt + D → Discord + workspace 2

# Browser (Workspace 3)
Cmd + Alt + A → Dia Browser + workspace 3

# Productivity (Workspace 4)
Cmd + Alt + N → Notion + workspace 4

# Media (Workspace 5)
Cmd + Alt + M → Spotify + workspace 5
```

### Automated Setup Commands
```bash
# Workspace automation via skhd
Shift + Left Alt + 1 → Dev workspace (Cursor + Warp)
Shift + Left Alt + 2 → Communication (Zalo + Discord)
```

## Advanced Input Management

### Karabiner-Elements Configuration (`karabiner/`)
- **Caps Lock Remapping**: Acts as Escape on single press, Hyper key when held
- **Vim Navigation**: Caps Lock + H/J/K/L → Arrow keys system-wide
- **Hyper Key Shortcuts**: Caps Lock + ; (Backspace), Caps Lock + ' (Delete)
- **Alternative Navigation**: Right Option + H/J/K/L → Arrow keys

### SKHD Hotkey Daemon (`skhd/`)
- **Simple syntax**: `modifier - key : command` format
- **Accessibility required**: Must grant permissions in System Preferences
- **Service management**: `skhd --start-service`, `skhd --restart-service`
- **Debug mode**: `skhd --config ~/.config/skhd/skhdrc --verbose`

## Application Behavior Rules

### Automatic Workspace Assignment
Apps automatically move to designated workspaces when opened:
- **Browser apps** → Workspace 1 (Dia Browser)  
- **Communication apps** → Workspace 2 (Zalo, Discord, Zoom)
- **Development apps** → Workspace 3 (Cursor, VS Code Insiders)
- **Productivity apps** → Workspace 4 (Notion, Obsidian)
- **Media apps** → Workspace 5 (Spotify, VLC)

### Floating Window Rules
These apps never tile and always float as popups:
- **System utilities**: Finder, Calculator, Activity Monitor, System Preferences
- **Media apps**: Apple Music, Spotify, VLC, YouTube Music
- **Communication**: Apple Mail
- **Security**: 1Password
- **Tools**: CleanShot X, LookAway

## Service Management Commands

### SKHD Management
```bash
# Start skhd service
skhd --start-service

# Restart after config changes
skhd --restart-service

# Stop service
skhd --stop-service

# Test configuration
skhd --config ~/.config/skhd/skhdrc --verbose
```

### Multi-Service Restart
```bash
# Restart all window management services
skhd --restart-service && aerospace reload-config

# Restart status bar integration
brew services restart sketchybar
```

## Troubleshooting Integration Issues

### SKHD Permission Problems
```bash
# Check if skhd is running
pgrep skhd

# View error logs
tail -f /tmp/skhd_$USER.err.log

# Grant accessibility permissions in System Preferences
open "x-apple.systempreferences:com.apple.preference.security?Privacy_Accessibility"
```

### AeroSpace Integration
```bash
# Reload configuration
aerospace reload-config

# Debug window assignments
aerospace list-windows --workspace all

# Check app IDs for rules
osascript -e 'id of app "App Name"'
```

---

## 📦 Backup & Recovery System

### Automated Backup Locations
| Backup Type | Location | Created When | Retention |
|-------------|----------|--------------|-----------|
| **Daily Auto** | `/Users/maccredyreina/.dotfiles-backup-YYYYMMDD/` | Before major changes | 30 days |
| **Experiment** | `/Users/maccredyreina/.dotfiles/[tool]-backup-[feature]/` | Before testing new configs | Manual cleanup |
| **Git Snapshots** | Local git history | Every commit | Permanent |

### Recovery Procedures

#### Quick Recovery (Same Day)
```bash
# Restore from today's backup
cp -r ~/.dotfiles-backup-$(date +%Y%m%d)/* ~/.dotfiles/
stow aerospace sketchybar skhd karabiner tmux
aerospace reload-config && brew services restart sketchybar
```

#### Selective Component Recovery
```bash
# Restore specific tool (example: AeroSpace)
cp ~/.dotfiles-backup-YYYYMMDD/aerospace/.config/aerospace/aerospace.toml \
   ~/.dotfiles/aerospace/.config/aerospace/
aerospace reload-config
```

#### Git-Based Recovery
```bash
# List recent configuration commits
git log --oneline -10 -- aerospace/ sketchybar/ tmux/

# Restore specific file to previous version
git checkout <commit-hash> -- aerospace/.config/aerospace/aerospace.toml
```

### Pre-Change Backup Protocol
**Always run before major changes:**
```bash
# Create timestamped backup
cp -r ~/.dotfiles ~/.dotfiles-backup-$(date +%Y%m%d-%H%M)

# Commit current state
cd ~/.dotfiles
git add -A
git commit -m "backup: Pre-change snapshot $(date +%Y-%m-%d)"

# Document planned changes in CLAUDE.md changelog
```

### Version Rollback Commands
```bash
# Emergency rollback to last working state
git checkout HEAD~1 -- aerospace/ sketchybar/ tmux/
stow aerospace sketchybar tmux
aerospace reload-config
brew services restart sketchybar

# Rollback specific keybind changes
git show HEAD~1:aerospace/.config/aerospace/aerospace.toml > \
  ~/.dotfiles/aerospace/.config/aerospace/aerospace.toml
```

---

## 🔄 Change Management Workflow

### For Future Configuration Changes:

1. **Pre-Change Setup**
   ```bash
   # Create backup with descriptive name
   cp -r ~/.dotfiles ~/.dotfiles-backup-$(date +%Y%m%d)-before-[change-description]
   
   # Document planned change in CLAUDE.md
   # Update version number and add changelog entry
   ```

2. **Testing Phase**
   ```bash
   # Make changes incrementally
   # Test each component individually
   # Document issues in CLAUDE.md
   ```

3. **Finalization**
   ```bash
   # Update CLAUDE.md with final results
   # Commit with descriptive message
   git add -A
   git commit -m "[scope]: [description] - v[new-version]"
   
   # Tag stable versions
   git tag -a v2.1 -m "Stable configuration after omerxx experiment revert"
   ```

### Emergency Contacts & Resources
- **Primary Config**: This CLAUDE.md file
- **Backup Locations**: Listed in backup table above  
- **Git History**: `git log --oneline` for change tracking
- **Community Resources**: 
  - AeroSpace: https://github.com/nikitabobko/AeroSpace
  - SketchyBar: https://github.com/FelixKratz/SketchyBar