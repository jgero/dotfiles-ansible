local utils = require('utils')

require('telescope').setup{
  defaults = {
    vimgrep_arguments = {
      'rg',
      '--color=never',
      '--no-heading',
      '--with-filename',
      '--line-number',
      '--column',
      '--smart-case'
    },
    prompt_position = "bottom",
    prompt_prefix = "> ",
    selection_caret = "> ",
    entry_prefix = "  ",
    initial_mode = "insert",
    selection_strategy = "reset",
    sorting_strategy = "descending",
    layout_strategy = "horizontal",
    layout_defaults = {
      horizontal = {
        mirror = false,
      },
      vertical = {
        mirror = false,
      },
    },
    file_sorter =  require'telescope.sorters'.get_fuzzy_file,
    file_ignore_patterns = {},
    generic_sorter =  require'telescope.sorters'.get_generic_fuzzy_sorter,
    shorten_path = true,
    winblend = 0,
    width = 0.75,
    preview_cutoff = 120,
    results_height = 1,
    results_width = 0.8,
    border = {},
    borderchars = { '─', '│', '─', '│', '╭', '╮', '╯', '╰' },
    color_devicons = true,
    use_less = true,
    set_env = { ['COLORTERM'] = 'truecolor' }, -- default = nil,
    file_previewer = require'telescope.previewers'.vim_buffer_cat.new,
    grep_previewer = require'telescope.previewers'.vim_buffer_vimgrep.new,
    qflist_previewer = require'telescope.previewers'.vim_buffer_qflist.new,

    -- Developer configurations: Not meant for general override
    buffer_previewer_maker = require'telescope.previewers'.buffer_previewer_maker
  }
}

-- find files in current working dir
utils.map('n', '<Leader>ff', ":lua require('telescope.builtin').find_files()<CR>")
-- find GIT files in current working dir
utils.map('n', '<Leader>fg', ":lua require('telescope.builtin').git_files()<CR>")
-- find words
utils.map('n', '<leader>fw',  ":lua require('telescope.builtin').live_grep()<cr>")
-- find in current buffers
utils.map('n', '<leader>fb',  ":lua require('telescope.builtin').buffers()<cr>")
-- find in help tags
utils.map('n', '<leader>fh',  ":lua require('telescope.builtin').help_tags()<cr>")
-- find files in notes
utils.map('n', '<Leader>fn', ":lua require('telescope.builtin').find_files({ search_dirs = { '/home/jgero/sync/notes' } })<CR>")
-- find files in dotfiles
utils.map('n', '<Leader>fd', ":lua require('telescope.builtin').find_files({ search_dirs = { '/home/jgero/repos/dotfiles' } })<CR>")
-- find in document symbols (this is insanely nice)
utils.map('n', '<Leader>fs', ":lua require('telescope.builtin').lsp_document_symbols()<CR>")

