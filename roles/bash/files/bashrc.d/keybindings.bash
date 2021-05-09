# add fzf keybindings
if [ -x "$(command -v fzf)"  ]
then
  source /usr/share/fzf/shell/key-bindings.bash
fi

# bind ctrl-f to the tmux session switcher
bind -x '"\C-f": "$HOME/repos/dotfiles/roles/util_scripts/files/selectProject"'

