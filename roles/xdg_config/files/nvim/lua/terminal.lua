local utils = require('utils')

-- exit terminal mode with escape
utils.map('t', '<Esc>', '<C-\\><C-n>')
-- open new terminal on the bottom
utils.map('', '<leader>t', ':split term://bash<cr>')

