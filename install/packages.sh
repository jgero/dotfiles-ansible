#! /bin/bash

# TODO: redo this to work with fedora silverblue

# organizing: thunderbird, task (taskwarrior)
# backup: restic
# dev: git, neovim (0.5 is needed so currently nightly has to be setup manually)
# finding stuff: fzf, ripgrep
# notebook: tlp
# utils: xclip (to enable yanking to clipboard)

sudo dnf install \
    git make g++ unzip cmake curl ripgrep fzf alacritty nodejs npm ImageMagick \
    i3 xclip \
    xrandr arandr redshift tlp xinput \
    task restic thunderbird
