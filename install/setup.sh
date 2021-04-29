#! /bin/bash

# setting this flag will print every command that is executed
set -x

############################# xdg_config #####################################

# check if there is already a config
if [[ -d "$HOME/.config" ]]; then
    MOVE_CONFIG=true
fi

# move config temporarily
if [[ $MOVE_CONFIG ]]; then
    mv "$HOME/.config" "$HOME/_temp_config"
fi

# link the config dir
ln -sv $HOME/repos/dotfiles/xdg_config $HOME/.config

# copy old config back in and delete temp directory
if [[ $MOVE_CONFIG ]]; then
    cp -r $HOME/_temp_config/* $HOME/.config/
    rm -rf $HOME/_temp_config
fi

############################# home_config ####################################

# link the bashrc
if ! [[ -f "$HOME/.bashrc" ]]; then
    ln -vs $HOME/repos/dotfiles/home/.bashrc $HOME/.bashrc
fi

# link bash user function dir
if [[ -d "$HOME/.bashrc.d" ]]; then
    MOVE_CONFIG=true
    mv "$HOME/.bashrc.d" "$HOME/_temp_bashrc"
    ln -sv $HOME/repos/dotfiles/home/bashrc.d $HOME/.bashrc.d
    cp -r $HOME/_temp_bashrc/* $HOME/.bashrc.d/
    rm -rf $HOME/_temp_bashrc
else
    ln -sv $HOME/repos/dotfiles/home/bashrc.d $HOME/.bashrc.d
fi

# link bash user autocompletion dir
if [[ -d "$HOME/.bash_completion.d" ]]; then
    MOVE_CONFIG=true
    mv "$HOME/.bash_completion" "$HOME/_temp_bash_completion"
    ln -sv $HOME/repos/dotfiles/home/bash_completion.d $HOME/.bash_completion.d
    cp -r $HOME/_temp_bash_completion/* $HOME/.bash_completion.d/
    rm -rf $HOME/_temp_bash_completion
else
    ln -sv $HOME/repos/dotfiles/home/bash_completion.d $HOME/.bash_completion.d
fi

