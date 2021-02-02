# Source manjaro-zsh-configuration
if [[ -e /usr/share/zsh/manjaro-zsh-config ]]; then
  source /usr/share/zsh/manjaro-zsh-config
fi
# Use manjaro zsh prompt
if [[ -e /usr/share/zsh/manjaro-zsh-prompt ]]; then
  source /usr/share/zsh/manjaro-zsh-prompt
fi

# aliases
alias vim="nvim"

# extend path
export PATH="$HOME/Documents/latex-helper:$PATH"
export PATH=$PATH:/usr/local/go/bin

# used for auto sourcing vimrc
export MYVIMRC=$HOME/.config/nvim/init.vim

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

