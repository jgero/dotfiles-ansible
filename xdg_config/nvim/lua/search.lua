local utils = require('utils')

utils.map('n', '<CR>', '{ -> v:hlsearch ? ":nohl\\<CR>" : "\\<CR>" }()', { expr = true })

-- nnoremap <expr> <CR> {-> v:hlsearch ? ":nohl\<CR>" : "\<CR>"}()
