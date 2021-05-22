local utils = require'utils'

-- set splitting direction
utils.opt('o', 'splitright', true)
utils.opt('o', 'splitbelow', true)

utils.map('n', '<leader>+', ':resize +1<cr>')
utils.map('n', '<leader>-', ':resize -1<cr>')

utils.map('n', '<C-f>', ':lua require("harpoon.term").sendCommand(1, "selectProject\\n"); require("harpoon.term").gotoTerminal(1)<CR>')

