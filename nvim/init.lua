-- import plugins
require('plugins')

-- set leader key
vim.g.mapleader = ' '

-- utils
local utils = require('utils')

-- tab management
utils.opt('b', 'tabstop', 4)
utils.opt('b', 'softtabstop', 4)
utils.opt('b', 'shiftwidth', 4)
utils.opt('b', 'expandtab', true)
utils.opt('b', 'smartindent', true)

-- auto source vimrc from project dirs if they exist
utils.opt('o', 'exrc', true)

-- line numbers
utils.opt('w', 'number', true)
utils.opt('w', 'relativenumber', true)

-- turn off highlights after search is done
utils.opt('o', 'hlsearch', false)
-- nomally ignore case but do not ignore case when search is in uppercase
utils.opt('o', 'ignorecase', true)
utils.opt('o', 'smartcase', true)

-- keep buffers open
utils.opt('o', 'hidden', true)

utils.opt('w', 'wrap', false)
utils.opt('w', 'colorcolumn', '100')

-- history
utils.opt('o', 'backup', false)
utils.opt('o', 'swapfile', false)
utils.opt('o', 'undofile', true)

-- scrolling before cursor reaches the end
utils.opt('o', 'scrolloff', 8)

utils.opt('o', 'updatetime', 50)
utils.opt('o', 'completeopt', 'menuone,noselect')
utils.opt('o', 'cmdheight', 2)

-- import configs
require('colors')
require('telescope-config')
require('gitsigns-config')

-- highlighting
require('treesitter')

-- auto pairs
require('autopairs')

-- lsp
require('lsp.general')
