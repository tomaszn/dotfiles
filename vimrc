set encoding=utf-8

" vim-plug configuration
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

Plug 'mileszs/ack.vim'
Plug 'kien/ctrlp.vim'
Plug 'raimondi/delimitmate'
Plug 'mattn/emmet-vim'
Plug 'othree/html5.vim'
Plug 'martinda/Jenkinsfile-vim-syntax'
Plug 'klen/python-mode'
Plug 'Valloric/YouCompleteMe'
Plug 'tpope/vim-fugitive'
"Plug 'vim-syntastic/syntastic'

" Add plugins to &runtimepath
call plug#end()

syntax on
colorscheme slate
set background=dark

filetype plugin indent on
set smartindent
set ignorecase
set smartcase

set hlsearch
:nohlsearch
" Press F4 to toggle highlighting on/off, and show current value.
:noremap <Space> :set hlsearch! hlsearch?<CR>
:nnoremap <Space> :let @/='\<<C-R>=expand("<cword>")<CR>\>'<CR>:set hls<CR>

let @s='VGd^W^WGp<80>kuVggd^W^WP:diffupdate^M'

" ack.grep configuration
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
  cnoreabbrev ag Ack
  cnoreabbrev aG Ack
  cnoreabbrev Ag Ack
  cnoreabbrev AG Ack
endif

filetype plugin indent on

let g:netrw_liststyle = 1
let g:netrw_browse_split = 4
let g:netrw_winsize = 39

