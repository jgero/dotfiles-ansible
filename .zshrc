# APPEARANCE -----------------------------------------------------------------------------------

# preferred colors are:
# #282C34
# #E06C75
# #98C379
# #E5C07B
# #61AFEF
# #C678DD
# #56B6C2
# #ABB2BF
#
ZSH_THEME="fishy"

# ALIASES -------------------------------------------------------------------------------------

# faster vim access
alias vim="nvim"
# open dotfiles in vim
alias dotfiles="nvim ~/.dotfiles"
# go home
alias home="cd ~/"

# PATH ----------------------------------------------------------------------------------------

# helper to start a docker container to compile latex
export PATH="$HOME/Documents/latex-helper:$PATH"
# default go path
export PATH=$PATH:/usr/local/go/bin

# OTHER ENVIRONMENT VARIABLES -----------------------------------------------------------------
# used for auto sourcing init.vim
export MYVIMRC=$HOME/.config/nvim/init.vim

# OH MY ZSH ------------------------------------------------------------------------------------

# Path to your oh-my-zsh installation.
export ZSH="/home/jgero/.oh-my-zsh"
# load oh my zsh
source $ZSH/oh-my-zsh.sh
# oh my zsh plugins
plugins=(git fzf)

# OTHER SOURCES --------------------------------------------------------------------------------

# keybindings for fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
