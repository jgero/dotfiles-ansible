#! /bin/bash

# print all actions
set -x

mkdir -p $XDG_CONFIG_HOME/systemd/user

# setup systemd backup services
UNIT_DIR="$HOME/repos/dotfiles/systemd/units"
ENV_DIR="$HOME/repos/dotfiles/systemd/env"

# link the units
for rc in "$UNIT_DIR/*"; do
    systemctl --user link $rc
done

# link the environments
for rc in "$ENV_DIR/*"; do
    ln -s $rc "$XDG_CONFIG_HOME/systemd/user/$(basename $rc)"
done

# reload the daemon
systemctl --user daemon-reload
# enable the services
systemctl --user enable restic_prune.timer --now
systemctl --user enable restic_backup.timer --now
systemctl --user enable restic_backupToHarddrive --now

