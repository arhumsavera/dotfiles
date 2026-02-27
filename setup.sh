#!/bin/bash
# Dotfiles setup — installs deps and symlinks configs

set -e

DOTFILES_DIR="${HOME}/scripts/dotfiles"

if [ ! -d "$DOTFILES_DIR" ]; then
    echo "Error: Dotfiles not found at $DOTFILES_DIR"
    echo "Clone first: git clone https://github.com/arhumsavera/dotfiles ~/scripts/dotfiles"
    exit 1
fi

echo "Installing dependencies..."
brew install tmux fzf ripgrep gh zoxide
brew install zsh zsh-syntax-highlighting zsh-autosuggestions
brew install oh-my-posh

echo "Creating symlinks..."

# Helper to create symlink (removes existing)
link() {
    local src="$1" dest="$2"
    mkdir -p "$(dirname "$dest")"
    rm -f "$dest"
    ln -sf "$src" "$dest"
}

# Ghostty
link "$DOTFILES_DIR/ghostty/config" "${HOME}/Library/Application Support/com.mitchellh.ghostty/config"

# tmux
link "$DOTFILES_DIR/tmux/.tmux.conf" "${HOME}/.tmux.conf"

# Zed
mkdir -p "${HOME}/.config/zed/scripts"
link "$DOTFILES_DIR/zed/settings.json" "${HOME}/.config/zed/settings.json"
link "$DOTFILES_DIR/zed/keymap.json" "${HOME}/.config/zed/keymap.json"
link "$DOTFILES_DIR/zed/tasks.json" "${HOME}/.config/zed/tasks.json"
link "$DOTFILES_DIR/zed/scripts/fzf-search.sh" "${HOME}/.config/zed/scripts/fzf-search.sh"
chmod +x "$DOTFILES_DIR/zed/scripts/fzf-search.sh"

# oh-my-posh themes
mkdir -p "${HOME}/scripts/themes"
link "$DOTFILES_DIR/omp/emodipt-extend.omp.json" "${HOME}/scripts/themes/emodipt-extend.omp.json"

# zsh
link "$DOTFILES_DIR/zsh/.zshrc" "${HOME}/.zshrc"

# opencode
mkdir -p "${HOME}/.config/opencode/themes"
link "$DOTFILES_DIR/opencode/themes/system-transparent-fix.json" "${HOME}/.config/opencode/themes/system-transparent-fix.json"

echo "Done!"
