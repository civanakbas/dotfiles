-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function()
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  -- Better Syntax Support
  use 'sheerun/vim-polyglot'
  -- File Explorer
  use 'scrooloose/NERDTree'
  -- Auto pairs for '(' '[' '{'
  use 'jiangmiao/auto-pairs'
  -- lightline
  use 'itchyny/lightline.vim'
  -- Autocomp
  use 'vim-scripts/AutoComplPop'
  -- autoformat
  use 'Chiel92/vim-autoformat'
  -- gitgutter
  use 'airblade/vim-gitgutter'

  use 'qpkorr/vim-renamer'

  use {'dracula/vim', as = 'dracula'}
end)
