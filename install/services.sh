#! /bin/bash

# print all actions
set -x

# setup systemd backup services
UNIT_DIR="$HOME/repos/dotfiles/systemd/units"
ENV_DIR="$HOME/repos/dotfiles/systemd/env"

# link the units
for rc in "$UNIT_DIR/*"; do
    if [ -f "$rc" ]; then
        # the units have to be linked via systemd, otherwise they can't be enabled
        systemctl --user link "$UNIT_DIR/$rc"
    fi
done

# link the environments
for rc in "$ENV_DIR/*"; do
    if [ -f "$rc" ]; then
        ln -s $rc "$HOME/.config/systemd/user/$rc"
    fi
done

# TODO: check if the linking works and enable services
# systemctl --user enable UNIT --now

