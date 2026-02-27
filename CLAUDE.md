# Dotfiles — Arhum's Dev Setup

## Overview
MacBook Pro dev environment configs. Optimized for remote SSH from iPad via Tailscale + tmux.

## Architecture
- **Ghostty** — terminal emulator, keybinds send tmux commands via escape sequences
- **tmux** — session persistence, splits, tabs. Auto-starts "main" session locally, "ipad" via SSH
- **Zed** — primary code editor (replaced VS Code)
- **Tailscale** — mesh VPN for SSH from anywhere
- **Termius** — iPad SSH client, uses Ctrl+B prefix for tmux

## Key Design Decisions
- Ghostty intercepts Cmd keys and translates to tmux via `text:\x02` (Ctrl+B prefix) sequences
- F9/F10/F12 are used as relay keys between Ghostty and tmux (avoids conflicts with shell/Raycast)
- Zed status bar toggle uses a task that runs sed on settings.json (no native toggle action exists)
- pane::SplitAndMoveRight is the correct Zed action for split (not SplitRight which duplicates)
- Non-native fullscreen in Ghostty to preserve transparency
- pmset configured to prevent sleep on AC power for always-on SSH access

## Gotchas
- Option+Arrow = zsh word-jump, never bind in tmux
- Cmd+Opt+Arrow = Raycast window management, never rebind
- Ghostty `\n` in text: sequences doesn't send Enter, use `\x0d`
- Cmd+Shift+. is hardcoded to Zed AI assistant, can't override
- Zed has no maximize terminal panel or custom window title support
- macOS native fullscreen breaks Ghostty transparency
- opencode `system` theme transparency breaks text contrast on selected items; use `system-transparent-fix` theme instead

## File Map
```
ghostty/config                              → ~/Library/Application Support/com.mitchellh.ghostty/config
tmux/.tmux.conf                             → ~/.tmux.conf
zed/settings.json                           → ~/.config/zed/settings.json
zed/keymap.json                             → ~/.config/zed/keymap.json
zed/tasks.json                              → ~/.config/zed/tasks.json
zed/scripts/fzf-search.sh                  → ~/.config/zed/scripts/fzf-search.sh
omp/                                        → ~/scripts/themes/
zsh/.zshrc                                  → ~/.zshrc
scripts/                                    → ~/scripts/
opencode/themes/system-transparent-fix.json → ~/.config/opencode/themes/system-transparent-fix.json
```

## Setup
```bash
git clone https://github.com/arhumsavera/dotfiles ~/scripts/dotfiles
bash ~/scripts/dotfiles/setup.sh
```
Also install: Ghostty, Tailscale (or run setup.sh which installs the rest)
