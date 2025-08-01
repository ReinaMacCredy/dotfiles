#!/usr/bin/env bash

# =================================================================================
# Dotfiles Setup Script
# Automated installation and configuration for macOS development environment
# =================================================================================

set -e  # Exit on any error

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Helper functions
print_info() {
    echo -e "${BLUE}[INFO]${NC} $1"
}

print_success() {
    echo -e "${GREEN}[SUCCESS]${NC} $1"
}

print_warning() {
    echo -e "${YELLOW}[WARNING]${NC} $1"
}

print_error() {
    echo -e "${RED}[ERROR]${NC} $1"
}

# Check if running on macOS
check_macos() {
    if [[ "$OSTYPE" != "darwin"* ]]; then
        print_error "This script is designed for macOS only."
        exit 1
    fi
    print_success "macOS detected"
}

# Check if Homebrew is installed
check_homebrew() {
    if ! command -v brew &> /dev/null; then
        print_info "Installing Homebrew..."
        /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
        
        # Add Homebrew to PATH for Apple Silicon Macs
        if [[ $(uname -m) == "arm64" ]]; then
            echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> ~/.zprofile
            eval "$(/opt/homebrew/bin/brew shellenv)"
        fi
        
        print_success "Homebrew installed"
    else
        print_success "Homebrew already installed"
    fi
}

# Install packages from Brewfile
install_packages() {
    print_info "Installing packages from Brewfile..."
    
    if [[ -f "brew/Brewfile" ]]; then
        brew bundle install --file=brew/Brewfile
        print_success "Packages installed from Brewfile"
    else
        print_warning "Brewfile not found, skipping package installation"
    fi
}

# Apply configurations using stow
apply_configurations() {
    print_info "Applying configurations using GNU Stow..."
    
    # Get all actual dotfile directories (exclude special directories)
    configurations=()
    for dir in */; do
        dir_name="${dir%/}"
        # Skip non-config directories
        if [[ "$dir_name" != "brew" && "$dir_name" != ".git" && "$dir_name" != "sketchybar-backup"* ]]; then
            configurations+=("$dir_name")
        fi
    done
    
    print_info "Found ${#configurations[@]} configurations to apply: ${configurations[*]}"
    
    for config in "${configurations[@]}"; do
        if [[ -d "$config" ]]; then
            print_info "Applying $config configuration..."
            stow "$config" 2>/dev/null || {
                print_warning "Failed to apply $config configuration (may already exist or have conflicts)"
                # Try to resolve common conflicts
                if [[ "$config" == "zsh" ]]; then
                    print_info "Backing up existing zsh config and retrying..."
                    [[ -f ~/.zshrc ]] && mv ~/.zshrc ~/.zshrc.backup.$(date +%Y%m%d)
                    [[ -f ~/.zshenv ]] && mv ~/.zshenv ~/.zshenv.backup.$(date +%Y%m%d)
                    stow "$config" 2>/dev/null && print_success "$config configuration applied after backup"
                fi
            }
        else
            print_warning "Configuration directory $config not found, skipping"
        fi
    done
    
    print_success "Configuration application completed"
}

# Set proper permissions for SSH
setup_ssh_permissions() {
    if [[ -d "$HOME/.ssh" ]]; then
        print_info "Setting proper SSH permissions..."
        chmod 700 "$HOME/.ssh"
        find "$HOME/.ssh" -type f -name "config" -exec chmod 600 {} \;
        find "$HOME/.ssh" -type f -name "known_hosts" -exec chmod 644 {} \;
        find "$HOME/.ssh" -type d -name "sockets" -exec chmod 700 {} \;
        print_success "SSH permissions set"
    fi
}

# Start services
start_services() {
    print_info "Starting system services..."
    
    # Start Homebrew services
    services=(
        "skhd"
        "sketchybar"
    )
    
    for service in "${services[@]}"; do
        if brew services list | grep -q "$service"; then
            print_info "Starting $service..."
            brew services start "$service" 2>/dev/null || {
                print_warning "Failed to start $service (may not be installed)"
            }
        fi
    done
    
    print_success "Services started"
}

# Create necessary directories
create_directories() {
    print_info "Creating necessary directories..."
    
    directories=(
        "$HOME/.config"
        "$HOME/.local/bin"
        "$HOME/.local/share"
        "$HOME/.cache"
        "$HOME/Developer"
        "$HOME/Projects"
    )
    
    for dir in "${directories[@]}"; do
        if [[ ! -d "$dir" ]]; then
            mkdir -p "$dir"
            print_success "Created directory: $dir"
        fi
    done
}

# Generate SSH keys if they don't exist
generate_ssh_keys() {
    if [[ ! -f "$HOME/.ssh/id_ed25519" ]]; then
        print_info "Generating SSH key..."
        read -p "Enter your email for SSH key: " email
        ssh-keygen -t ed25519 -C "$email" -f "$HOME/.ssh/id_ed25519"
        
        # Add to SSH agent
        eval "$(ssh-agent -s)"
        ssh-add --apple-use-keychain "$HOME/.ssh/id_ed25519" 2>/dev/null || ssh-add "$HOME/.ssh/id_ed25519"
        
        print_success "SSH key generated"
        print_info "Add this public key to your Git hosting service:"
        cat "$HOME/.ssh/id_ed25519.pub"
    else
        print_success "SSH key already exists"
    fi
}

# Set macOS defaults
set_macos_defaults() {
    if [[ -f "macos-defaults/.config/macos-defaults/set-defaults.sh" ]]; then
        print_info "Setting macOS defaults..."
        bash "macos-defaults/.config/macos-defaults/set-defaults.sh"
        print_success "macOS defaults set"
    fi
}

# Main installation function
main() {
    print_info "Starting dotfiles setup..."
    
    # Change to dotfiles directory
    cd "$(dirname "$0")"
    
    # Run setup steps
    check_macos
    check_homebrew
    create_directories
    install_packages
    apply_configurations
    setup_ssh_permissions
    generate_ssh_keys
    set_macos_defaults
    start_services
    
    print_success "Dotfiles setup completed!"
    print_info "Please restart your terminal or run 'source ~/.zshrc' to apply changes"
    print_info "You may need to restart some applications for all changes to take effect"
    
    # Show next steps
    echo
    print_info "Next steps:"
    echo "  1. Add your SSH public key to GitHub/GitLab"
    echo "  2. Configure Git with your name and email if not already done"
    echo "  3. Restart your terminal"
    echo "  4. Test that all applications work as expected"
    echo
}

# Run main function
main "$@"