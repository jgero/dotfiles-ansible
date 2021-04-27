# PATH ----------------------------------------------------------------------------------------

# default go path
export PATH=$PATH:/usr/local/go/bin
# add custom scripts dir
export PATH=$PATH:$HOME/repos/dotfiles/scripts

# OTHER ENVIRONMENT VARIABLES -----------------------------------------------------------------

# preferred container runtime (used in some of my makefiles)
export CONTAINER_RUNTIME=podman
# used for auto sourcing init.vim
export MYVIMRC=$HOME/.config/nvim/init.vim
export TASKRC=~/.config/.taskrc

