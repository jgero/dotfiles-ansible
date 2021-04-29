local utils = require('utils')

-- copy to clipboard
utils.map('v', '<leader>y', '"+y')

-- paste from clipboard
utils.map('n', '<leader>p', '"+p')
utils.map('n', '<leader>P', '"+P')
utils.map('v', '<leader>p', '"+p')
utils.map('v', '<leader>P', '"+P')

