call plug#begin('~/.config/nvim/autoload/plugged')

    " Better Syntax Support
    Plug 'sheerun/vim-polyglot'
    " File Explorer
    Plug 'scrooloose/NERDTree'
    " Auto pairs for '(' '[' '{'
    Plug 'jiangmiao/auto-pairs'
    " lightline
    Plug 'itchyny/lightline.vim'
    " Theme
    Plug 'morhetz/gruvbox'
    Plug 'sonph/onehalf', { 'rtp': 'vim' }
    call plug#end()
