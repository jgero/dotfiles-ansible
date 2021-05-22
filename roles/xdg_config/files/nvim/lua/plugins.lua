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
    use 'tpope/vim-surround'
    use 'tpope/vim-commentary'
    use 'JoosepAlviste/nvim-ts-context-commentstring'
    use 'tpope/vim-repeat'

    -- navigation
    use {
        'nvim-telescope/telescope.nvim',
        requires = {{'nvim-lua/popup.nvim'}, { 'nvim-lua/plenary.nvim'} }
    }
    use {
        'ThePrimeagen/harpoon',
        requires = {
            'nvim-lua/plenary.nvim'
        }
    }

    -- visuals
    use 'gruvbox-community/gruvbox'
    use 'folke/tokyonight.nvim'

    -- git stuff
    use 'tpope/vim-fugitive'
    use {
        'lewis6991/gitsigns.nvim',
        requires = {
            'nvim-lua/plenary.nvim'
        }
    }

    -- general lsp
    use 'neovim/nvim-lspconfig'
    -- use local version of lspcontainers for now until podman pr is merged
    use '~/repos/lspcontainers.nvim'
    use 'nvim-treesitter/nvim-treesitter'
    use {
      'nvim-treesitter/completion-treesitter',
      run = function() vim.cmd [[TSUpdate]] end
    }
    -- auto install servers
    use 'kabouzeid/nvim-lspinstall'
    -- completion
    use 'hrsh7th/nvim-compe'
    use 'hrsh7th/vim-vsnip'
    use 'windwp/nvim-autopairs'
end)

