set backupdir=~/.vim/backups
set directory=~/.vim/swapfiles
set undodir=~/.vim/undofiles
set runtimepath^=~/.vim runtimepath+=~/.vim/after

"call plug#begin('~/.vim/plugged')

    " Allows you to cycle through colors
"    Plug 'felixhummel/setcolors.vim'
    " Tree Browser
"    Plug 'scrooloose/nerdtree'
    " Adds in solarized colors
"    Plug 'altercation/vim-colors-solarized'
    " Adds in colorschemes
"    Plug 'flazz/vim-colorschemes'
    "Plug 'Rip-Rip/clang_complete'
    " Autocomplete Plugin
"    Plug 'Shougo/deoplete.nvim', {'do': ':UpdateRemotePlugins'}
"    Plug 'Shougo/neoinclude.vim'
"    Plug 'zchee/deoplete-clang'

"call plug#end()

"let g:deoplete#enable_at_startup = 1

"let g:deoplete#sources#clang#libclang_path='/usr/lib/llvm-3.8/lib/libclang.so'
"let g:deoplete#sources#clang#clang_header='/usr/lib/llvm-3.8/lib/clang/'

colorscheme evening

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
set undofile
set visualbell
set wildmode=list:longest
set number
set nowrap

set ignorecase
set smartcase
set gdefault
set showmatch

set list
set listchars=tab:>-,eol:$
command! Q q!
command! W w !sudo tee % > /dev/null
command! Tree NERDTree
"map ; :
imap <C-BS> <C-W>

function! Untabify()
"    let times = &tabstop
"    let replaceText = ''
    execute '%s/\t/' . repeat(' ', &tabstop)
endfunction

command! Untabify call Untabify()
"silent !stty -ixon
"autocmd VimLeave * silent !stty ixon
autocmd BufWritePre * :%s/\s\+$//e
"map <C-s> :w<CR> :echo "Saved" <CR>
"imap <C-s> <Esc> :w <CR> :echo "Saved" <CR> i
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

map <a-1> :tabn 1<CR>
map <a-2> :tabn 2<CR>
map <a-3> :tabn 3<CR>
map <a-4> :tabn 4<CR>
map <a-5> :tabn 5<CR>
map <a-6> :tabn 6<CR>
map <a-7> :tabn 7<CR>
map <a-8> :tabn 8<CR>
map <a-9> :tabn 9<CR>


map <a-w> <c-w>
map <a-l> <c-w>l
map <a-k> <c-w>k
map <a-j> <c-w>j
map <a-h> <c-w>h
imap <a-l> <esc><c-w>li
imap <a-k> <esc><c-w>ki
imap <a-j> <esc><c-w>ji
imap <a-h> <esc><c-w>hi

noremap <Up> <c-w>k
noremap <Down> <c-w>j
noremap <Left> <c-w>h
noremap <Right> <c-w>l

tnoremap <Esc> <C-\><C-n>


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

