# Oh My Zsh
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="robbyrussell"
plugins=(git zsh-autosuggestions zsh-fzf-history-search zsh-syntax-highlighting)
source $ZSH/oh-my-zsh.sh

# History
setopt HIST_EXPIRE_DUPS_FIRST
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_FIND_NO_DUPS
setopt HIST_SAVE_NO_DUPS

# Python
source "${HOME}/scripts/py312/bin/activate"
export PATH="${HOME}/.local/bin:$PATH"

# oh-my-posh
if [ "$TERM_PROGRAM" != "Apple_Terminal" ]; then
  eval "$(oh-my-posh init zsh --config "${HOME}/scripts/themes/emodipt-extend.omp.json")"
fi

# Aliases
alias dcb="docker-compose build"
alias dcu="docker-compose up"
alias dcd="docker-compose down"

# Auto-launch tmux
if [[ -z "$TMUX" && "$TERM_PROGRAM" == "ghostty" ]]; then
  tmux new-session -A -s main
elif [[ -z "$TMUX" && -n "$SSH_CONNECTION" ]]; then
  tmux new-session -A -s ipad
fi
