require'nvim-treesitter.configs'.setup {
    ensure_installed = { 'dart', 'latex', 'svelte', 'html', 'css', 'javascript', 'bash' },
    indent = {
      enable = true
    },
    context_commentstring = {
        enable = true
    },
    highlight = {
        enable = true,
    },
}

