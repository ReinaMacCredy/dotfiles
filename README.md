# 🏠 Dotfiles

> A comprehensive, security-conscious dotfiles configuration for macOS developers

These are my personal dotfiles, featuring a complete development environment setup with AeroSpace window management, SketchyBar customization, and a curated collection of development tools. Feel free to use, modify, or learn from anything in this repository.

## ✨ Features

- 🪟 **AeroSpace Window Manager** - i3-like tiling window management for macOS
- 📊 **SketchyBar** - Custom status bar with workspace indicators
- 🐚 **Zsh Configuration** - With Starship prompt and useful aliases
- 🍺 **Homebrew Setup** - 80+ carefully selected packages and applications
- 🔧 **Development Tools** - Complete setup for multiple programming languages
- 🎨 **Terminal Customization** - Multiple terminal options (WezTerm, tmux)
- 🔒 **Security Audited** - Comprehensive security cleanup, safe for public sharing
- 📦 **Stow Management** - Easy symlink management for clean organization

## 🚀 Quick Start

**New Machine Setup (5 minutes):**

```bash
# 1. Install Homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# 2. Clone and setup dotfiles
git clone https://github.com/ReinaMacCredy/dotfiles.git ~/.dotfiles
cd ~/.dotfiles

# 3. Install all packages and applications
brew bundle install --file=brew/Brewfile

# 4. Setup configurations with stow
stow zsh git aerospace sketchybar tmux
```

That's it! Your development environment is ready to go.

## 📋 What's Included

### 🛠️ Development Tools
- **Languages**: Go, Python 3.10/3.11, Node.js (via nvm)
- **Editors**: Neovim with extensive VS Code extensions
- **Git**: Enhanced with git-lfs and lazygit
- **Databases**: PostgreSQL 15, Redis
- **Containers**: Docker support

### 🖥️ System & Window Management
- **AeroSpace** - Tiling window manager with custom keybinds
- **SketchyBar** - Custom status bar
- **Borders** - Window border system
- **Rectangle** - Window management fallback

### 🔧 Terminal & CLI Tools
- **Terminal Emulators**: WezTerm, built-in Terminal
- **Multiplexers**: tmux, zellij
- **Shell**: Zsh with Starship prompt
- **File Management**: Superfile, bat (cat replacement)
- **System Monitoring**: btop, fastfetch
- **Search**: fzf (fuzzy finder)

### 🎯 Productivity Applications
- **Browser**: Brave Browser, Firefox, Chrome
- **Password**: 1Password
- **Notes**: Obsidian
- **Communication**: Discord, Teams, Slack, Signal
- **Media**: Spotify, YouTube Music, VLC
- **Design**: Affinity Suite (Designer, Photo, Publisher)

## ⌨️ AeroSpace Keybinds

**Layout Management:**
- `Option + Shift + P` - Toggle horizontal/vertical layout
- `Option + \`` - Toggle window floating/tiling
- `Option + Shift + Q` - Enter service mode

**Workspace Navigation:**
- `Option + Q/W/1/2/3` - Switch to workspace 1-5 (Custom layout)
- `Option + Shift + E/W/1/2/3` - Move window to workspace 1-5

**Window Focus:**
- `Cmd + Alt + Ctrl + Shift + N/E/I/O` - Focus left/down/up/right

**Service Mode (after Option + Shift + Q):**
- `N/E/I/O` - Join windows left/down/up/right
- `Arrow Keys` - Resize windows
- `R` - Reset layout
- `C` - Reload config
- `Esc` - Exit service mode

## 🏗️ Workspace Organization

**Automatic App Assignment:**
- **Workspace 1**: Browser apps (Dia Browser)
- **Workspace 2**: Communication (Zalo, Discord, Zoom)
- **Workspace 3**: Development (Cursor, VS Code Insiders)  
- **Workspace 4**: Productivity (Notion, Obsidian)
- **Workspace 5**: Media (Spotify, VLC)

**Floating Apps** (never tile):
- System utilities (Finder, Calculator, Activity Monitor)
- Media apps (Apple Music, Spotify, VLC, YouTube Music)
- Security apps (1Password)

## 🔧 Detailed Setup

### Prerequisites
- macOS (tested on Sonoma+)
- Admin access for Homebrew installation

### Step-by-Step Installation

1. **Install Homebrew** (if not already installed):
```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

2. **Clone the repository**:
```bash
git clone https://github.com/ReinaMacCredy/dotfiles.git ~/.dotfiles
cd ~/.dotfiles
```

3. **Install packages**:
```bash
# Install all Homebrew packages and applications
brew bundle install --file=brew/Brewfile

# This installs 80+ packages including:
# - Development tools (git, neovim, python, go)
# - Applications (aerospace, brave-browser, obsidian)
# - VS Code extensions (claude-code, gitlens, etc.)
```

4. **Apply configurations**:
```bash
# Use stow to create symlinks for each configuration
stow zsh        # Shell configuration
stow git        # Git settings
stow aerospace  # Window manager
stow sketchybar # Status bar
stow tmux       # Terminal multiplexer
# Add other configurations as needed
```

5. **Reload your shell**:
```bash
source ~/.zshrc
# or restart your terminal
```

### Manual Configuration

Some applications may require manual setup:
- **AeroSpace**: Restart AeroSpace or reload config with `Option + Shift + Q` → `C`
- **SketchyBar**: May need to restart: `brew services restart sketchybar`
- **VS Code**: Extensions will install automatically via Brewfile

## 🎨 Customization

### Modifying Configurations

Each tool's configuration is in its own directory:
- `aerospace/` - Window management settings
- `zsh/` - Shell configuration and aliases
- `git/` - Git settings and aliases
- `sketchybar/` - Status bar customization
- `tmux/` - Terminal multiplexer settings

### Adding New Packages

Update your Brewfile and commit changes:
```bash
# Install new package
brew install package-name

# Update Brewfile
brew bundle dump --force --file=brew/Brewfile

# Commit changes
git add brew/Brewfile
git commit -m "Add package-name to Brewfile"
```

### Stow Usage

```bash
# Apply a configuration
stow directory-name

# Remove a configuration
stow -D directory-name

# Dry run to see what would change
stow -n directory-name
```

## 🔍 Troubleshooting

### Common Issues

**AeroSpace not working:**
```bash
# Restart AeroSpace
brew services restart aerospace
# Or reload config: Option + Shift + Q → C
```

**SketchyBar not appearing:**
```bash
# Restart SketchyBar
brew services restart sketchybar
```

**Zsh configuration not loading:**
```bash
# Check if ZDOTDIR is set correctly
echo $ZDOTDIR
# Should point to ~/.config/zsh

# Reload configuration
source ~/.zshrc
```

**Stow conflicts:**
```bash
# If you get conflicts, backup existing files first
mv ~/.zshrc ~/.zshrc.backup
stow zsh
```

### Getting Help

1. Check the configuration files for inline documentation
2. Review the original tool documentation
3. Open an issue in this repository

## 🤝 Contributing

Contributions are welcome! If you have improvements or fixes:

1. Fork the repository
2. Create a feature branch: `git checkout -b feature-name`
3. Make your changes
4. Test thoroughly
5. Submit a pull request

### Guidelines
- Keep configurations well-documented
- Test on fresh macOS installation when possible
- No secrets or personal information
- Follow existing code style

## 🔒 Security

### Repository Security Status: **SECURE** ✅

This repository has undergone comprehensive security audit and cleanup:

- **✅ No Sensitive Data**: All SSH configurations, credentials, and personal information removed
- **✅ Git History Clean**: Complete git history purged of sensitive data (179 commits rewritten)
- **✅ Public-Safe Design**: Repository designed for safe public sharing
- **✅ Automated Protection**: Comprehensive .gitignore prevents future sensitive data commits

### Security Features

- **No Hardcoded Secrets**: All configurations use placeholders or environment variables
- **XDG Compliance**: Configuration isolation from sensitive data directories
- **Regular Audits**: Security audit report available for reference

**Security Audit Report**: Available at `security-audit-report.md`

## 📜 Credits

- Original dotfiles inspiration from [mplusp/dotfiles](https://github.com/mplusp/dotfiles)
- AeroSpace configuration community examples
- Various tool configurations from the open source community

## 📄 License

This project is open source and available under the [MIT License](LICENSE).

---

**Made with ❤️ for the developer community**

> 💡 **Tip**: Star this repository if you find it useful, and feel free to fork it for your own customizations!