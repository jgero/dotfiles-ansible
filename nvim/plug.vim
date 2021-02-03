" auto-install vim-plug
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  "autocmd VimEnter * PlugInstall
  autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

call plug#begin('~/.config/nvim/autoload/plugged')

  " Better Comments
  Plug 'preservim/nerdcommenter'
  " Repeat stuff (fixes '.' command for plugins)
  Plug 'tpope/vim-repeat'
  " Surround
  Plug 'tpope/vim-surround'
  " more git tools
  Plug 'tpope/vim-fugitive' 
  " auto close brackets
  Plug 'jiangmiao/auto-pairs'
  " git changes next to line numbers
  Plug 'mhinz/vim-signify'
  " icons
  Plug 'lambdalisue/nerdfont.vim'
  " File Search
  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
  Plug 'junegunn/fzf.vim'
  " intellisense
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
  " better statusline
  Plug 'itchyny/lightline.vim'
  Plug 'mengelbrecht/lightline-bufferline'
  " color theme
  Plug 'joshdick/onedark.vim'
  " better syntax highlighting
  Plug 'sheerun/vim-polyglot'
  " filetype from context
  Plug 'Shougo/context_filetype.vim'

call plug#end()

" Automatically install missing plugins on startup
autocmd VimEnter *
  \  if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \|   PlugInstall --sync | q
  \| endif
