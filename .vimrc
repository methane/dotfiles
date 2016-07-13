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
set expandtab
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

noremap tt :TagbarToggle<CR>

"let g:ag_prg='ag --column'
let g:khuno_ignore='E123,E126,E127,E302,E501'
let g:khuno_max_line_length=99

"let g:jedi#popup_on_dot = 0
"let g:jedi#autocompletion_command = "<C-x>"
"let g:gofmt_command = 'goimports'
let g:vim_markdown_folding_disabled=1

let g:markdown_fenced_languages = [
\  'css',
\  'javascript',
\  'js=javascript',
\  'json=javascript',
\  'ruby',
\  'html',
\  'python',
\  'go',
\]

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

let g:ctrlp_extensions = ['buffer', 'line']
let g:ctrlp_clear_cache_on_exit = 1
let g:ctrlp_working_path_mode = 0


if isdirectory(expand('~/.vim/bundle/neobundle.vim/')) &&  has('vim_starting')
set rtp+=~/.vim/bundle/neobundle.vim/

call neobundle#begin(expand('~/.vim/bundle/'))

NeoBundle 'Shougo/neobundle.vim'
" MacVim-kaoriya provides vimproc
NeoBundle 'Shougo/vimproc.vim', {
      \ 'build' : {
      \     'windows' : 'tools\\update-dll-mingw',
      \     'cygwin' : 'make -f make_cygwin.mak',
      \     'mac' : 'make -f make_mac.mak',
      \     'unix' : 'make -f make_unix.mak',
      \    },
      \ }
NeoBundle 'rking/ag.vim'
NeoBundle 'majutsushi/tagbar'
NeoBundle "ctrlpvim/ctrlp.vim"
NeoBundle "justinmk/vim-dirvish"

NeoBundle 'fatih/vim-go'
NeoBundleLazy 'godlygeek/tabular', {"autoload": {"commands": ["Tab", "Tabularize"]}}
NeoBundleLazy 'alfredodeza/khuno.vim', {"autoload": {"filetype": ["python"]}}
NeoBundleLazy 'davidhalter/jedi-vim', {"autoload": {"filetype": ["python"]}}
NeoBundleLazy 'plasticboy/vim-markdown', {"autoload": {"filetype": ["markdown"]}}

" Color
NeoBundle 'tomasr/molokai'

call neobundle#end()
endif


au BufNewFile,BufRead *.md  setlocal wrap ft=markdown
au BufNewFile,BufRead *.tsv setlocal noexpandtab ts=16
au BufNewFile,BufRead *.cs  setlocal noexpandtab ts=4
au FileType gitconfig setlocal ts=8 noexpandtab
au FileType rst setlocal ts=3 sw=3 expandtab
au FileType go setlocal sw=8 ts=8 sts=8 noexpandtab
au FileType c setlocal sw=4 ts=4 sts=4 expandtab

set wildignore+=*.a,*.o,*.pyc,*.pyo
set wildignore+=*/__pycache__/*
set wildignore+=*/.git/*
set wildignore+=*/.hg/*

" :CdCurrent
" Change current directory to current file's one.
command! -nargs=0 CdCurrent cd %:p:h

colorscheme delek
"colorscheme molokai
"colorscheme railscasts
syntax on
filetype plugin indent on
