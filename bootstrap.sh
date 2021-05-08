#!/usr/bin/env bash
set -e

# dotfiles' project root directory
DOTFILES="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# install ansible if it's missing
dnf list installed "ansible" > /dev/null || sudo dnf install ansible

# run Ansible playbook using our user
ansible-playbook -i "$DOTFILES/hosts" "$DOTFILES/dotfiles.yml" --ask-become-pass

exit 0

