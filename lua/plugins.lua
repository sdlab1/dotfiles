-- This file can be loaded by calling `lua require('plugins')` from your init.vim

return require('packer').startup(function(use)
  -- Packer can manage itself
use 'wbthomason/packer.nvim'
use 'preservim/nerdtree' -- file system browser
use 'pangloss/vim-javascript' -- javascript syntax highlight
use 'nvim-treesitter/nvim-treesitter'
use { 'stevearc/aerial.nvim', config = function() require('aerial').setup() end }
-- LSP Support
use 'neovim/nvim-lspconfig'
use 'williamboman/mason.nvim'
use 'williamboman/mason-lspconfig.nvim'
-- Completion
use 'hrsh7th/nvim-cmp'
use 'hrsh7th/cmp-nvim-lua'
use 'hrsh7th/cmp-nvim-lsp'
use 'hrsh7th/cmp-buffer'
use 'hrsh7th/cmp-path'
use 'hrsh7th/cmp-cmdline'
use 'ray-x/cmp-treesitter'
--use 'quangnguyen30192/cmp-nvim-tags'
--use 'hrsh7th/cmp-omni'
-- Snippets
--use 'L3MON4D3/LuaSnip'
use { "L3MON4D3/LuaSnip", run = "make install_jsregexp" }
use 'saadparwaiz1/cmp_luasnip'
use 'rafamadriz/friendly-snippets'
-- THEMES
use 'navarasu/onedark.nvim'
use 'dracula/vim'
use 'marko-cerovac/material.nvim'
use 'folke/tokyonight.nvim'
use 'tomasiser/vim-code-dark'
end)


