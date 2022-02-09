"CONFIG FILES
source $HOME/.config/nvim/vim-plug/plugins.vim

filetype plugin on

"Disable arrow keys
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>


"Stuff idk
set number relativenumber
set tabstop=4
set noshowmode
set nocompatible
set clipboard=unnamedplus
nmap <F6> :NERDTreeToggle<CR>
set nu
set incsearch
set background=dark
nmap <space> <leader>
nnoremap <Space> <Nop>
noremap <leader>y "+y
noremap <leader>p "+p


" backspace works on indents and across lines
set backspace=indent,eol,start


" theme stuff

syntax on
set t_Co=256
colorscheme dracula
let g:lightline = {'colorscheme': 'onehalfdark'}
set cursorline


" for command mode
nnoremap <S-Tab> <<
" for insert mode
inoremap <S-Tab> <C-d>


" Autocomplete
set complete+=kspell
set completeopt=menuone,longest
set shortmess+=c

" make it transparent
hi Normal guibg=NONE ctermbg=NONE
