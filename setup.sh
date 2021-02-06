#! /bin/bash

# nvim config dir
ln -sf $PWD/nvim $HOME/.config/nvim
# git
ln -sf $PWD/.gitconfig $HOME/.gitconfig
# zsh
ln -sf $PWD/.zshrc $HOME/.zshrc
# kde "konsole" terminal emulator
ln -sf $PWD/kde/konsolerc $HOME/.config/konsolerc
ln -sf $PWD/kde/my-zsh.profile $HOME/.local/share/konsole/my-zsh.profile
ln -sf $PWD/kde/my-zsh.colorscheme $HOME/.local/share/konsole/my-zsh.colorscheme
