local utils = require'utils'

-- set splitting direction
utils.opt('o', 'splitright', true)
utils.opt('o', 'splitbelow', true)

utils.map('n', '<leader>+', ':resize +1<cr>')
utils.map('n', '<leader>-', ':resize -1<cr>')

