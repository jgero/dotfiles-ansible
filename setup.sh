#! /bin/bash

# nvim config dir
ln -sf $PWD/nvim $HOME/.config/nvim
# git
ln -sf $PWD/.gitconfig $HOME/.gitconfig

# bash
mkdir -p $HOME/.bashrc.d
ln -sf $PWD/bash/*.bash $HOME/.bashrc.d
