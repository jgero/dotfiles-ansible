#!/usr/bin/bash

# works with neovim and if node and npm are already installed

set -o nounset    # error when referencing undefined variable
set -o errexit    # exit when command fails

# Install extensions
mkdir -p ~/.config/coc/extensions
cd ~/.config/coc/extensions
if [ ! -f package.json ]
then
  echo '{"dependencies":{}}'> package.json
fi
# install coc extensions
npm install coc-explorer coc-angular coc-emmet coc-eslint coc-highlight coc-prettier coc-svelte coc-vimlsp coc-snippets coc-tsserver coc-html coc-css coc-json coc-yaml --global-style --ignore-scripts --no-bin-links --no-package-lock --only=prod

# install providers for extensions
python3 -m pip install --user --upgrade pynvim
npm install -g neovim
