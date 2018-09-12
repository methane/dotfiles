" vim: sw=4 ts=4 expandtab:
" coding: utf-8
set scrolloff=6
set backspace=indent,eol,start
set cinkeys-=0#
if isdirectory(expand('~/var/vim'))
    set backupdir=~/var/vim/back
    set dir=~/var/vim/swap
    set undodir=~/var/vim/undo
endif

" no indent for case: , public:
set cino=:0,g0,t0
set nowrap
set showcmd
set cmdheight=1
set ignorecase
set tags=tags;/
set nowrapscan
set ts=4 sw=4 sts=4 expandtab
set laststatus=2 " always show statusline
set noerrorbells " bell->vbell & vbell=none
set visualbell t_vb=
set whichwrap=b,s,h,l,<,>,[,]
set t_Co=256

set showtabline=2   " always show tabline
set background=dark " dark or light

"noremap j gj
"noremap k gk
"noremap <UP> gk
"noremap <DOWN> gj
cnoremap <C-A> <Home>
cnoremap <C-B> <Left>
cnoremap <C-F> <Right>

set fencs=utf-8,iso-2022-jp,euc-jp,cp932
set formatoptions+=mM

""" plugins

let g:vim_markdown_folding_disabled=1

noremap tt :TagbarToggle<CR>

let g:tagbar_type_go = {
    \ 'ctagstype' : 'go',
    \ 'kinds'     : [
        \ 'p:package',
        \ 'i:imports:1',
        \ 'c:constants',
        \ 'v:variables',
        \ 't:types',
        \ 'n:interfaces',
        \ 'w:fields',
        \ 'e:embedded',
        \ 'm:methods',
        \ 'r:constructor',
        \ 'f:functions'
    \ ],
    \ 'sro' : '.',
    \ 'kind2scope' : {
        \ 't' : 'ctype',
        \ 'n' : 'ntype'
    \ },
    \ 'scope2kind' : {
        \ 'ctype' : 't',
        \ 'ntype' : 'n'
    \ },
    \ 'ctagsbin'  : 'gotags',
    \ 'ctagsargs' : '-sort -silent'
\ }


" ctrlp settings
let g:ctrlp_extensions = ['buffer', 'line']
let g:ctrlp_clear_cache_on_exit = 1
let g:ctrlp_working_path_mode = 0

""" vim-plug
"curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
if has('vim_starting')
    set rtp+=~/.vim/plugged/vim-plug
    if !isdirectory(expand('~/.vim/plugged/vim-plug'))
        echo 'install vim-plug...'
        call system('mkdir -p ~/.vim/plugged/vim-plug')
        call system('git clone https://github.com/junegunn/vim-plug.git ~/.vim/plugged/vim-plug/autoload')
    end
endif
call plug#begin('~/.vim/plugged')
Plug 'junegunn/vim-plug', {'dir': '~/.vim/plugged/vim-plug/autoload'}

" memo: MacVim-kaoriya provides vimproc
Plug 'Shougo/vimproc.vim', { 'do': 'make' }
Plug 'rking/ag.vim', { 'on': 'Ag' }
Plug 'majutsushi/tagbar'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'justinmk/vim-dirvish'
"Plug 'fatih/vim-go', { 'for': 'go' }
"Plug 'plasticboy/vim-markdown', { 'for': ['markdown'] }
"Plug 'godlygeek/tabular', { 'on': ['Tab', 'Tabularize'] }
"Plug 'alfredodeza/khuno.vim', { 'for': ['python'] }
"Plug 'davidhalter/jedi-vim', { 'for': ['python'] }
call plug#end()


au BufNewFile,BufRead *.md  setlocal wrap ft=markdown
au BufNewFile,BufRead *.tsv setlocal noexpandtab ts=16
au BufNewFile,BufRead *.cs  setlocal noexpandtab ts=4
au FileType gitconfig setlocal ts=8 noexpandtab
au FileType rst setlocal ts=3 sw=3 expandtab
au FileType go setlocal sw=4 ts=4 sts=4 noexpandtab
au FileType c setlocal sw=4 ts=4 sts=4 expandtab
au FileType html setlocal sw=2

set wildignore+=*.a,*.o,*.pyc,*.pyo
set wildignore+=*/__pycache__/*
set wildignore+=*/.git/*
set wildignore+=*/.hg/*

" :CdCurrent
" Change current directory to current file's one.
command! -nargs=0 CdCurrent cd %:p:h

colorscheme delek
"colorscheme railscasts
syntax on
filetype plugin indent on
