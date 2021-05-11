# Dotfiles

Dotfiles for my Fedora silverblue workstation. They include the most important configurations of
the tools I use all the time. This is not a visual rice, this is a workflow rice.

I use taskwarrior, toolbox, bash, tmux and most importantly: neovim. 

There are scripts in the `install` directory to link the configs and setup the
systemd services. The repo has to be cloned into your `$HOME/repos/dotfiles` directory to work.

In the future I want to add a script to automatically setup the complete OS, but currently this is
just work in progress. (rpm-ostree, flatpaks, dnf, ...)

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

To make it easy to manage different restic-repositories and to be able to push it to this github
repo I split the repo and password files into separate env files. So to be able to run the provided
services install script you have to create __2__ files for the 2 backup services with the names
`restic_creds.env` and `restic_creds_local.env` in the `sytemd/env/` directory. This allows you to
backup your files to different targets, for example I use a cloud and a hard drive. The contents of
the env files with the credentials have to look like this:

```
RESTIC_PASSWORD="xxxxx"
RESTIC_REPOSITORY="xxxxx"
```

## take quick note without getting distracted

I often have random ideas about things completely unrelated to the stuff I am currently doing. So I
wrote a script that opens a new buffer in nvim with the current date as filename and adds a line in
it with the current time each time I open it (`scripts/quicknote`). With a keymapping that opens
this buffer in a floating window I can dump my ideas and have them in a chronological order to later
sort stuff out.

## neovim

My neovim config really is nothing special. It is more or less a setup of some nice plugins with all
the neovim builtin goodness (lsp + treesitter).

## keybindings

### desktop/workspaces

The keybindings for my desktop and window managing are not inluded here because I use Gnome and I
just remapped the workspace switching to vim-like mappings with `Alt` (german qwertz) key as
"leader".

For quick terminal access i mapped `Alt+Enter` to start a new termainal and `Alt+n` to open my quick
notes thing.

### tmux

I left the default `Ctrl+b` leader here. In the beginning it feels a bit weird but it's actually not
as bad to type as it feels first.

