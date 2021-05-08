# ALIASES -------------------------------------------------------------------------------------

# faster vim access
alias vim="$HOME/.local/apps/squashfs-root/usr/bin/nvim"
# open dotfiles in vim
alias dotfiles="vim -c 'cd $HOME/repos/dotfiles' $HOME/repos/dotfiles/."
# cd to root of current git root
alias gitroot='cd $(git rev-parse --show-toplevel)'

