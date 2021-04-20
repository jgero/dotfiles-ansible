#! /bin/bash

# nvim config dir
ln -sf $PWD/nvim $HOME/.config/nvim

# git
ln -sf $PWD/.gitconfig $HOME/.gitconfig

# taskwarrior config
ln -sf $PWD/.taskrc $HOME/.taskrc

# bash stuff - see readme what it takes to make this work
ln -sf $PWD/bash $HOME/.bashrc.d

# systemd services with config files

# restic settings
cp $PWD/systemd/restic/settings.env $HOME/.config/systemd/user/restic-settings.env
# backups with restic
cp $PWD/systemd/restic/backup.service $HOME/.config/systemd/user/restic-backup.service
cp $PWD/systemd/restic/backupToHarddrive.service $HOME/.config/systemd/user/backupToHarddrive.service
cp $PWD/systemd/restic/backup.timer $HOME/.config/systemd/user/restic-backup.timer
# prune restic repo
cp $PWD/systemd/restic/prune.service $HOME/.config/systemd/user/restic-prune.service
cp $PWD/systemd/restic/prune.timer $HOME/.config/systemd/user/restic-prune.timer

