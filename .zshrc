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
# automatically start latex container
alias latex='podman run -v ${PWD}/:/app/ -it --rm ghcr.io/jgero/latex-container/compile-latex-container:v6'
# cd to root of current git root
alias gitroot='cd $(git rev-parse --show-toplevel)'

# PATH ----------------------------------------------------------------------------------------

# helper to start a docker container to compile latex
export PATH="$HOME/Documents/latex-helper:$PATH"
# default go path
export PATH=$PATH:/usr/local/go/bin

# OTHER ENVIRONMENT VARIABLES -----------------------------------------------------------------

# preferred container runtime (used in some of my makefiles)
export CONTAINER_RUNTIME=podman
# used for auto sourcing init.vim
export MYVIMRC=$HOME/.config/nvim/init.vim

# OH MY ZSH PLUGINS ---------------------------------------------------------------------------

# config for autosuggestions
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=4"
bindkey '^ ' autosuggest-accept

# LOAD OH MY ZSH ------------------------------------------------------------------------------

# Path to your oh-my-zsh installation.
export ZSH="/home/jgero/.oh-my-zsh"
# oh my zsh plugins
plugins=(git fzf zsh-autosuggestions)
# load oh my zsh
source $ZSH/oh-my-zsh.sh

# OTHER SOURCES -------------------------------------------------------------------------------

# keybindings for fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# STARTUP SCRIPT ------------------------------------------------------------------------------

# go to git root if in a git repo
if git rev-parse --is-insider-work-tree > /dev/null 2>&1; then
  gitroot
fi;

