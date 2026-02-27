#!/usr/bin/env bash
# fzf-powered project search for Zed
# ripgrep → fzf with bat preview → opens result in Zed at the exact line

set -euo pipefail

RG_PREFIX="rg --column --line-number --no-heading --color=always --smart-case"

selected=$(
  FZF_DEFAULT_COMMAND="$RG_PREFIX ''" \
  fzf --ansi \
      --disabled \
      --bind "change:reload:$RG_PREFIX {q} || true" \
      --bind "ctrl-f:unbind(change)+clear-query+enable-search" \
      --delimiter : \
      --preview 'bat --color=always --highlight-line {2} --style=numbers {1}' \
      --preview-window 'right,60%,+{2}-5' \
      --header '/ search (ctrl-f to fuzzy filter results)' \
      --prompt 'rg> ' \
      --bind 'ctrl-f:change-prompt(fzf> )' \
) || exit 0

file=$(echo "$selected" | cut -d: -f1)
line=$(echo "$selected" | cut -d: -f2)

if [ -n "$file" ]; then
  zed "$file:$line"
fi
