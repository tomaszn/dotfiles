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
Plug 'Valloric/YouCompleteMe',  {'do': 'python ./install.py'}
Plug 'tpope/vim-fugitive'
Plug 'vim-syntastic/syntastic'
Plug 'klen/python-mode', {'branch': 'develop'}
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


set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

let g:syntastic_python_checkers = ['pyflakes']

"let g:pymode_lint_on_write = 0
autocmd FileType python set colorcolumn=88
let g:pymode_options_max_line_length = 88
let g:pymode_lint_options_pep8 = {'max_line_length': g:pymode_options_max_line_length}
let g:pymode_options_colorcolumn = 1
