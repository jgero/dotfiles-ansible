-- setup flutter tools
require("flutter-tools").setup {
    flutter_path = "/home/jgero/Android/flutter/bin/flutter"
}

-- enable telescope extension from the flutter tools extension
require("telescope").load_extension("flutter")

-- add keybinding for telescope extension only on flutter buffers
local on_attach = function(client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  -- Mappings.
  local opts = { noremap=true, silent=true }
  buf_set_keymap('n', '<leader>fr', "<Cmd>lua require('telescope').extensions.flutter.commands()<CR>", opts)
end
require'lspconfig'.dartls.setup{ on_attach = on_attach }

