#!/usr/bin/env bash
set -e

# dotfiles' project root directory
DOTFILES="$HOME/repos/dotfiles"
# host file location
HOSTS="$DOTFILES/hosts"
# main playbook
PLAYBOOK="$DOTFILES/dotfiles.yml"

# Installs ansible
dnf install ansible

# Runs Ansible playbook using our user.
ansible-playbook -i "$HOSTS" "$PLAYBOOK" --ask-become-pass

exit 0

