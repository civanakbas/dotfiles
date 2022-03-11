lua require('plugins')

filetype plugin on

"Disable arrow keys
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
nnoremap j gj
nnoremap k gk

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

" add persistent undo
if has('persistent_undo')      "check if your vim version supports it
  set undofile                 "turn on the feature  
  set undodir=$HOME/.vim/undo  "directory where the undo files will be stored
  endif

" backspace works on indents and across lines
set backspace=indent,eol,start


" theme stuff

syntax on
set t_Co=256
colorscheme dracula
let g:lightline = {'colorscheme': 'dracula'}
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
