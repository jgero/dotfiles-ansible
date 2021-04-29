# Dotfiles

Dotfiles for my Fedora workstation i3 spin setup. They include the most important configurations of
the tools I use all the time. This is not a visual rice, this is a workflow rice.

I use taskwarrior, i3, bash, tmux and most importantly: neovim. 

There are scripts in the __install__ directory to install packages, link the configs and setup the
systemd services. The repo has to be cloned into your `$HOME/repos/dotfiles` directory to work.

## restic backup

To make it easy to manage different restic-repositories and to be able to push it to this github
repo I split the repo and password files into separate env files. So to be able to run the provided services
install script you have to create __2__ files for the 2 backup services with the names
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
it with the current time each time I open it (`scripts/quicknote`). With a keymapping for i3
(leader-n) at opens this buffer in a floating window I can dump my ideas and have them in a
chronological order to later sort stuff out.

## neovim

My neovim config really is nothing special. It is more or less a setup of some nice plugins with all
the neovim builtin goodness (lsp + treesitter)

