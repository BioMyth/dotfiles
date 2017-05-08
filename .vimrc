set nocompatible              " be iMproved, required
syntax enable
filetype off                  " required
" set the runtime path to include Vundle and initialize
set backupdir=~/.vim/backups
set directory=~/.vim/swapfiles

let g:ycm_global_ycm_extra_conf = "~/.vim/.ycm_extra_conf.py"
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'felixhummel/setcolors.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'altercation/vim-colors-solarized'
Plugin 'flazz/vim-colorschemes'
Plugin 'Valloric/YouCompleteMe'
" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.


" All of your Plugins must be added before the following line
call vundle#end()            " required

filetype plugin indent on    " required

" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

"call pathogen#runtime_append_all_bundles()


set modelines=0

set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab

set encoding=utf-8
set scrolloff=3
set autoindent
set showmode
set showcmd
set hidden
set wildmenu
set wildmode=list:longest
set visualbell
set cursorline
set ttyfast
set ruler
set backspace=indent,eol,start
set laststatus=2
set undofile

set ignorecase
set smartcase
" set gdefault
set incsearch
set showmatch
set hlsearch
colorscheme Tomorrow-Night-Eighties

"set list
"set listchars=tab:\ ,eol:
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>
command Q q!
command Tree NERDTree
"command tree NERDTree
"map ; :
"imap <C-BS> <C-W>
" commands to enable control+s saves
silent !stty -ixon
autocmd VimLeave * silent !stty ixon
map <C-s> :w<CR> :echo "Saved" <CR>
imap <C-s> <Esc> :w <CR> :echo "Saved" <CR> i 
imap <C-x> <Esc>
"map <C-S> :wq<CR>
"imap <C-S> <Esc> :wq<CR>
nmap 1 :b1<CR>
nmap 2 :b2<CR>
nmap 3 :b3<CR>
nmap 4 :b4<CR>
nmap 5 :b5<CR>
nmap 6 :b6<CR>
nmap 7 :b7<CR>
nmap 8 :b8<CR>
nmap 9 :b9<CR>
