#!/bin/bash
# Dotfiles setup — symlinks configs to their expected locations
# Run: bash ~/scripts/dotfiles/setup.sh

DOTFILES="$HOME/scripts/dotfiles"

echo "Setting up dotfiles..."

# Ghostty
mkdir -p "$HOME/Library/Application Support/com.mitchellh.ghostty"
ln -sf "$DOTFILES/ghostty/config" "$HOME/Library/Application Support/com.mitchellh.ghostty/config"

# tmux
ln -sf "$DOTFILES/tmux/.tmux.conf" "$HOME/.tmux.conf"

# Zed
mkdir -p "$HOME/.config/zed"
ln -sf "$DOTFILES/zed/settings.json" "$HOME/.config/zed/settings.json"
ln -sf "$DOTFILES/zed/keymap.json" "$HOME/.config/zed/keymap.json"

# oh-my-posh
mkdir -p "$HOME/scripts/themes"
ln -sf "$DOTFILES/omp/emodipt-extend.omp.json" "$HOME/scripts/themes/emodipt-extend.omp.json"

# zsh
ln -sf "$DOTFILES/zsh/.zshrc" "$HOME/.zshrc"

echo "Done! All configs symlinked."
