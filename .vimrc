call plug#begin('~/.vim/plugged')
" On-demand loading
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'ctrlpvim/ctrlp.vim'
Plug 'sjl/gundo.vim'
Plug 'easymotion/vim-easymotion'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-fugitive'
Plug 'editorconfig/editorconfig-vim'
Plug 'scrooloose/syntastic'
call plug#end()


" indents
filetype plugin on
filetype indent on

" its 2010 after all
set nocompatible

"use modlines in files ?
set modelines=0

" tab = 2 spaces
" http://vimcasts.org/episodes/tabs-and-spaces/
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab

" moving between tabs with alt+h/l
map <silent><A-k> :tabnext<CR>
map <silent><A-j> :tabprevious<CR>
map <leader>t :tabedit 

"moving between buffers
map <C-Tab> :bnext<cr>
map <C-S-Tab> :bprevious<cr>

"Change buffer - without saving
set hid

"set iskeyword+=_,$,@,%,# " none of these are word dividers
"TEST: _ is a word divider ( good for vars like "is_in_cooperation"
"set iskeyword-=_

" no error indicators/blinking lights etc
set noerrorbells
set novisualbell
set t_vb=

"some standard settings
set encoding=utf-8
set scrolloff=3
set autoindent
set showmode
set showcmd
set hidden
set wildmenu
set wildmode=longest,list:longest,full
set visualbell
set ttyfast
set ruler
set backspace=indent,eol,start
"set laststatus=2
" vim 7.3
" relative numbers on left
"set relativenumber
set number
"set undofile

" Backups
set nobackup                        " enable backups
set noswapfile                  " tired of the swap files


" leader
let mapleader = ","

"searching 

" ignores case only when search string all lowercase
set ignorecase
set smartcase
" /g is default
set gdefault
" show results while typing
set incsearch
set showmatch
set hlsearch
" clear search
nnoremap <leader><space> :noh<cr>
" make tab key more better
" breakes snipmate
"noremap <tab> v>
"noremap <s-tab> v<
"vnoremap <tab> >gv
"vnoremap <s-tab> <gv

" long lines handling
set wrap
set textwidth=79
set formatoptions=qrn1
if version > 702
  set colorcolumn=85
endif
set cursorline
set showbreak=↪


"turn off arrows
"nnoremap <up> <nop>
"nnoremap <down> <nop>
"nnoremap <left> <nop>
"nnoremap <right> <nop>
"inoremap <up> <nop>
"inoremap <down> <nop>
"inoremap <left> <nop>
"inoremap <right> <nop>
nnoremap j gj
nnoremap k gk

" map f1 to esc
inoremap <F1> <ESC>
nnoremap <F1> <ESC>
vnoremap <F1> <ESC>

" maps ; to :
nnoremap ; :

" when loosing focus - save
au FocusLost * :wa

" TEST: jj -> ESC
inoremap jj <ESC>
" SPLIT WINDOWS
" open a split window and switch to it
nnoremap <leader>w <C-w>v<C-w>l

" ctrl +hjkl moves around windows in vim
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Sudo to write
cmap w!! w !sudo tee % >/dev/null

"Remove the Windows ^M
noremap <Leader>m mmHmt:%s/<C-V><cr>//ge<cr>'tzt'm

" Color scheme (terminal)
syntax on

set background=dark
let g:solarized_contrast='high'
let g:solarized_termcolors=256
colorscheme molokai
"colorscheme  solarized 

"Plugin configs
"
"Editor config
let g:EditorConfig_exclude_patterns = ['fugitive://.*']

" Yankring
nnoremap <silent> <F3> :YRShow<cr>
nnoremap <silent> <leader>y :YRShow<cr>

" Exuberant ctags!
map <F4> :TagbarToggle<cr>
map <F2> :!/usr/bin/ctags -R --c++-kinds=+p --fields=+iaS --extra=+q  .<cr>
nnoremap <F7> :GundoToggle<CR>

" NERDTree
let g:NERDTreeMapActivateNode = "o"
let g:NERDTreeMapCloseDir = "h"
nnoremap <silent> <F6> :NERDTreeToggle<cr>


" Rainbows!
"nmap <leader>R :RainbowParenthesesToggle<CR>

"command-T becomes commandG
"nmap <silent> <Leader>g :CommandT<CR>
let g:ctrlp_map = '<c-g>'
let g:ctrlp_cmd = 'CtrlPMixed'
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git\|dist'
let g:CommandTMaxFiles=30000

" Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
