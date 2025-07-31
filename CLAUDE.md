# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

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
  - Float toggle: `Cmd + Shift + \`
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

- Repository designed to be public-safe (no secrets or sensitive data)
- Git configuration includes real name/email (standard for public dotfiles)
- Proper `.gitignore` patterns for preventing accidental secret commits
- XDG compliance helps isolate configuration from data

## Development Context

This dotfiles system prioritizes:
- **Productivity**: Minimal workspaces, efficient keybinds, integrated tools
- **Portability**: One-command setup for new machines via Brewfile
- **Maintainability**: Modular stow packages, clear separation of concerns
- **Integration**: Tools work together (AeroSpace + SketchyBar, tmux + dev tools)
- **Security**: Safe for public sharing, follows best practices