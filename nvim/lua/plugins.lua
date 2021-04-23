-- package manager
local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
  fn.system({'git', 'clone', 'https://github.com/wbthomason/packer.nvim', install_path})
  execute 'packadd packer.nvim'
end

return require('packer').startup(function()
    use 'wbthomason/packer.nvim'
    use 'nvim-lua/plenary.nvim' 
    use {
        'nvim-telescope/telescope.nvim',
        requires = {{'nvim-lua/popup.nvim'}}
    }
    use 'gruvbox-community/gruvbox'

    -- general lsp
    use 'neovim/nvim-lspconfig'
    use 'kabouzeid/nvim-lspinstall'
    use 'nvim-lua/completion-nvim'
    use 'nvim-treesitter/nvim-treesitter'
    use {
      'nvim-treesitter/completion-treesitter',
      run = function() vim.cmd [[TSUpdate]] end
    }
    -- flutter
    use {'akinsho/flutter-tools.nvim'}
end)

