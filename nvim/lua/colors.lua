vim.o.termguicolors = true

-- tokyonight and gruvbox are installed
vim.cmd [[
    silent! colorscheme tokyonight
    augroup custom_highlight
        autocmd!
        au ColorScheme * highlight Normal guibg=none
    augroup END
]]
