" set the runtime path to include Vundle and initialize
set backupdir=~/.vim/backups
set directory=~/.vim/swapfiles
set undodir=~/.vim/undofiles
set runtimepath^=~/.vim runtimepath+=~/.vim/after

call plug#begin('~/.vim/plugged')
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plug 'VundleVim/Vundle.vim'
Plug 'felixhummel/setcolors.vim'
Plug 'scrooloose/nerdtree'
Plug 'altercation/vim-colors-solarized'
Plug 'flazz/vim-colorschemes'
Plug 'Shougo/deoplete.nvim', {'do': ':UpdateRemotePlugins'}
" The following are examples of different formats supported.

" All of your Plugins must be added before the following line
call plug#end()            " required

let g:deoplete#enable_at_startup = 1

set modelines=0

set expandtab
set shiftwidth=4
set softtabstop=4
set tabstop=4

set cursorline
set encoding=utf-8
set hidden
set laststatus=2
set scrolloff=3
set showmode
set ttyfast
set undofile
set visualbell
set wildmenu
set wildmode=list:longest
set number
set nowrap

set ignorecase
set smartcase
" set gdefault
set showmatch
colorscheme evening

set list
"set listchars=tab:>-,eol:$
command Q q!
command! W w !sudo tee % > /dev/null
command Tree NERDTree
"command tree NERDTree
"map ; :
"imap <C-BS> <C-W>
" commands to enable control+s saves
silent !stty -ixon
autocmd VimLeave * silent !stty ixon
autocmd BufWritePre * :%s/\s\+$//e
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

function! NrBufs()
    return len(filter(range(1, bufnr('$')), 'buflisted(v:val)'))
endfunction

set statusline=
set statusline+=%#keyword#
set statusline+=%F "filepath
set statusline+=%#string#
set statusline+=[%{strlen(&fenc)?&fenc:'none'}, "file encoding
set statusline+=%{&ff}] "file format
set statusline+=%h "help file flag
set statusline+=%#error#
set statusline+=%m "modified flag
set statusline+=%r "read only flag
"set statusline+=%y "filetype
set statusline+=%#keyword#
set statusline+=%= "left/right separator
set statusline+=%#class#
set statusline+=%c, "cursor column
set statusline+=%l/%L\  "cursor line / total lines
set statusline+=%n:%{NrBufs()}\ "adds in the buffer number

