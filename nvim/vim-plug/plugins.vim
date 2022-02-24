call plug#begin('~/.config/nvim/autoload/plugged')

    " Better Syntax Support
    Plug 'sheerun/vim-polyglot'
    " File Explorer
    Plug 'scrooloose/NERDTree'
    " Auto pairs for '(' '[' '{'
    Plug 'jiangmiao/auto-pairs'
    " lightline
    Plug 'itchyny/lightline.vim'
    " Autocomp
    Plug 'vim-scripts/AutoComplPop'
    " Theme
    Plug 'sonph/onehalf', { 'rtp': 'vim' }
    Plug 'dracula/vim', { 'as': 'dracula' }
    " autoformat
    Plug 'Chiel92/vim-autoformat'
    "gitgutter
    Plug 'airblade/vim-gitgutter'
    Plug 'qpkorr/vim-renamer'
    call plug#end()
