"CONFIG FILES
source $HOME/.config/nvim/vim-plug/plugins.vim


"Stuff idk
set number
set tabstop=4
set noshowmode
set nocompatible
set clipboard=unnamedplus
nmap <F6> :NERDTreeToggle<CR>
set nu
set incsearch
set background=dark



" theme stuff

syntax on
set t_Co=256
colorscheme dracula
let g:lightline = {'colorscheme': 'onehalfdark'}
set cursorline

" quality of life
let g:python_highlight_space_errors = 0

" for command mode
nnoremap <S-Tab> <<
" for insert mode
inoremap <S-Tab> <C-d>


" Autocomplete
set complete+=kspell
set completeopt=menuone,longest
set shortmess+=c
