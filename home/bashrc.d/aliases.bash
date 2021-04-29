# ALIASES -------------------------------------------------------------------------------------

# faster vim access
alias vim="$HOME/repos/nvim.appimage"
# open dotfiles in vim
alias dotfiles="vim -c 'cd $HOME/repos/dotfiles' $HOME/repos/dotfiles/."
# automatically start latex container
alias latex='podman run -v ${PWD}/:/app/:z -it --rm ghcr.io/jgero/latex-container/compile-latex-container:v6'
# cd to root of current git root
alias gitroot='cd $(git rev-parse --show-toplevel)'
