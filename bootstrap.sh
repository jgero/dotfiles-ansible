#!/usr/bin/env bash
set -e

# dotfiles' project root directory
DOTFILES="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# install ansible
sudo dnf install ansible

# run Ansible playbook using our user
ansible-playbook -i "$DOTFILES/hosts" "$DOTFILES/dotfiles.yml"
    --ask-become-pass
    --extra-vars "dotfiles=$DOTFILES home=$HOME config=$HOME/.config"

exit 0

