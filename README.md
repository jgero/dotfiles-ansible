# Dotfiles

Dotfiles for my Fedora workstation. They include the most important configurations of the tools I
use all the time and an Ansible playbook to set most of it up. This is not a visual rice, this is a
workflow rice.

I use taskwarrior, bash, tmux and most importantly: neovim.

__included in the playbook roles:__

- backup: restic backup systemd services and timers
- bash: bashrc and config
- devtools: installation of packages and setup for git
- fonts: fonts I like to use
- gnome: configuration of gonme shortcuts and settings
- util_scripts: scripts I use to automate small things
- xdg_config: the real "dotfile" part of the repo, contains configs of neovim, tmux, ...

__not included:__

- GNOME terminal settings
    - basically just turn off the bell and scrolling and use the JetBrains font with size 14
- commit signing with gpg

## git

I use different ssh keys for GitHub and Bitbucket, but since almost all my repos are on GitHub this
key is the default. For the repos that need a different key use
`git config --local core.sshCommand "ssh -i /path/to/private_key"` to change the local config.

The GitHub fingerprint can be found
[here](https://docs.github.com/en/github/authenticating-to-github/githubs-ssh-key-fingerprints).

### sign commits

Signing commits is not required and uses a password so I didn't include it in the playbook. But
GiHub has very helpful articles on [how to generate a gpg key](https://docs.github.com/en/github/authenticating-to-github/generating-a-new-gpg-key)
and [how to tell git to use the key](https://docs.github.com/en/github/authenticating-to-github/telling-git-about-your-signing-key).
`git config --global commit.gpgsign true` enables signing commits and
`git config --global user.signingkey <key-id>` tells git what key id to use.

## restic backup

My backups are done with restic, a tool for encrypted incremental backups that supports backups to
external harddrives, sftp servers and even object stores.

I don't want to have to think about my backups so I automatically run the backup to the remote repo
once per day via a systemd service with timer. The backup to the local drive starts everytime the
drive is plugged in.

The playbook automatically asks for the location of the local and remote restic-repositories and a
password. The backup to a local harddrive triggers on the systemd mount events, you have to change
the mount id of the drive you want to trigger on.

## neovim

My neovim config really is nothing special. It is more or less a setup of some nice plugins with all
the neovim builtin goodness (lsp + treesitter).

## small tools

Some tools for things I have to do often and find annoying:

### take quick note without getting distracted

I often have random ideas about things completely unrelated to the stuff I am currently doing. So I
wrote a script that opens a new buffer in nvim with the current date as filename and adds a line in
it with the current time each time I open it. With a keymapping that opens this buffer in a floating
window I can dump my ideas and have them in a chronological order to later sort stuff out.

### switch between projects

This tool is basically just a handy switcher between tmux sessions. It populates a fzf search with
projects in configured directories and then switches to a tmux session fitting to the project name.
If none exists a new one is created.

## keybindings

### desktop/workspaces

Fedora uses GNOME and I use some custom vim and i3-like keybindings. Switching between workspaces
and moving windows between workspaces is bound to `(Shift) + Alt + [hjkl]`.

For quick terminal access i mapped `Alt+Enter` to start a new termainal and `Alt+n` to open my quick
notes thing.

### terminal

- fzf keybindings (for example `Alt + c`)
- `Ctrl + f` for the project switcher

#### tmux

I use the default `Ctrl + b` leader and then added some vim-like bindings to switch between panes
and added `leader + Enter` to open a new split pane.

