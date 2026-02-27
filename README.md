# Dotfiles

My macOS dev environment configs — optimized for remote SSH from iPad via Tailscale + tmux.

## Quick Start

```bash
git clone https://github.com/arhumsavera/dotfiles ~/scripts/dotfiles
bash ~/scripts/dotfiles/setup.sh
```

You'll also need to manually install:
- [Ghostty](https://ghostty.org) — terminal emulator
- [Tailscale](https://tailscale.com) — VPN for remote access

## What's Inside

### Terminal Stack
- **Ghostty** — GPU-accelerated terminal with tmux keybindings baked in
- **tmux** — session persistence, splits, and window management
- **zsh** — shell with syntax highlighting, autosuggestions, and oh-my-posh prompt

### Editor
- **Zed** — fast, collaborative code editor with Python LSP (ty + ruff)

### Workflow
- **Tailscale** — access my Mac from anywhere via iPad
- **fzf** — fuzzy finding integrated into Zed

## File Structure

| Source | Destination |
|--------|-------------|
| `ghostty/config` | `~/Library/Application Support/com.mitchellh.ghostty/config` |
| `tmux/.tmux.conf` | `~/.tmux.conf` |
| `zed/settings.json` | `~/.config/zed/settings.json` |
| `zed/keymap.json` | `~/.config/zed/keymap.json` |
| `zed/tasks.json` | `~/.config/zed/tasks.json` |
| `zed/scripts/fzf-search.sh` | `~/.config/zed/scripts/fzf-search.sh` |
| `zsh/.zshrc` | `~/.zshrc` |
| `omp/emodipt-extend.omp.json` | `~/scripts/themes/` |
| `opencode/themes/system-transparent-fix.json` | `~/.config/opencode/themes/` |

## Key Shortcuts

### Ghostty + tmux
- `Cmd+]` / `Cmd+[` — switch panes
- `Cmd+\` — split right
- `Cmd+w` — close pane
- `Cmd+b` — tmux prefix (via Ghostty escape sequences)

### Zed
- `Cmd+.` — go to definition
- `Cmd+t` — project symbols
- `Cmd+Shift+o` — outline
- `Cmd+\` — split right
- `Alt+f` — fzf search
- `Cmd+Shift+b` — toggle status bar

## Design Notes

- Ghostty sends tmux commands via `text:\x02` escape sequences
- Zed uses `ty` as primary Python LSP (faster than pyright)
- Non-native fullscreen preserves Ghostty transparency
- No tmux bindings on Option+Arrow (zsh word-jump)

## Updating

After pulling changes:
```bash
bash ~/scripts/dotfiles/setup.sh
```

Or manually symlink individual files as needed.
