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
ln -sv ~/repos/dotfiles/xdg_config ~/.config

# copy old config back in and delete temp directory
if [[ $MOVE_CONFIG ]]; then
    cp -r ~/_temp_config/* ~/.config/
    rm -rf ~/_temp_config
fi

############################# home_config ####################################

# link the bashrc
if ! [[ -f "~/.bashrc" ]]; then
    ln -vs ~/repos/dotfiles/home/.bashrc ~/.bashrc
fi

# link bash user function dir
if [[ -d "$HOME/.bashrc.d" ]]; then
    MOVE_CONFIG=true
    mv "$HOME/.bashrc.d" "$HOME/_temp_bashrc"
    ln -sv ~/repos/dotfiles/home/bashrc.d ~/.bashrc.d
    cp -r ~/_temp_bashrc/* ~/.bashrc.d/
    rm -rf ~/_temp_bashrc
else
    ln -sv ~/repos/dotfiles/home/bashrc.d ~/.bashrc.d
fi

# link bash user autocompletion dir
if [[ -d "$HOME/.bash_completion.d" ]]; then
    MOVE_CONFIG=true
    mv "$HOME/.bash_completion" "$HOME/_temp_bash_completion"
    ln -sv ~/repos/dotfiles/home/bash_completion.d ~/.bash_completion.d
    cp -r ~/_temp_bash_completion/* ~/.bash_completion.d/
    rm -rf ~/_temp_bash_completion
else
    ln -sv ~/repos/dotfiles/home/bash_completion.d ~/.bash_completion.d
fi

# # systemd services with config files

# # restic settings
# cp $PWD/systemd/restic/settings.env $HOME/.config/systemd/user/restic-settings.env
# # backups with restic
# cp $PWD/systemd/restic/backup.service $HOME/.config/systemd/user/restic-backup.service
# cp $PWD/systemd/restic/backupToHarddrive.service $HOME/.config/systemd/user/backupToHarddrive.service
# cp $PWD/systemd/restic/backup.timer $HOME/.config/systemd/user/restic-backup.timer
# # prune restic repo
# cp $PWD/systemd/restic/prune.service $HOME/.config/systemd/user/restic-prune.service
# cp $PWD/systemd/restic/prune.timer $HOME/.config/systemd/user/restic-prune.timer

