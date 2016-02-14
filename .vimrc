:source /home/wert/.vim/ftplugin/python/ipy.vim
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-repeat'
Plugin 'kien/ctrlp.vim'
Plugin 'sjl/gundo.vim'
Plugin 'Valloric/YouCompleteMe'
Plugin 'scrooloose/syntastic'
Plugin 'altercation/vim-colors-solarized'
Plugin 'klen/python-mode'
Plugin 'bling/vim-airline'
Plugin 'yegappan/mru'
Plugin 'szw/vim-ctrlspace'
Plugin 'scrooloose/nerdcommenter'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'tpope/vim-surround'
call vundle#end()            " required
filetype plugin indent on    " required

syntax enable
set background=dark
let g:solarized_visibility = "high"
let g:solarized_contrast = "high"
set number
nnoremap <silent> + :exe "resize " . (winheight(0) * 3/2)<CR>
nnoremap <silent> - :exe "resize " . (winheight(0) * 2/3)<CR>
set rtp+=$HOME/.local/lib/python2.7/site-packages/powerline/bindings/vim/
" Always show statusline
set laststatus=2
set t_Co=256
set wildchar=<Tab> wildmenu wildmode=full
set wildcharm=<C-Z>
nnoremap <F10> :b <C-Z>
set hidden
hi CtrlSpaceSelected guifg=#586e75 guibg=#eee8d5 guisp=#839496
hi CtrlSpaceNormal   guifg=#839496 guibg=#021B25 guisp=#839496 gui=NONE ctermfg=12 ctermbg=0 cterm=NONE
hi CtrlSpaceSearch   guifg=#cb4b16 guibg=NONE gui=bold ctermfg=9 ctermbg=NONE term=bold cterm=bold
hi CtrlSpaceStatus   guifg=#839496 guibg=#002b36 gui=reverse term=reverse cterm=reverse ctermfg=12 ctermbg=8
let g:airline_exclude_preview = 1
set incsearch
set hlsearch
map <S-Insert> <MiddleMouse>
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

let g:pymode_rope_complete_on_dot = 0
let g:pymode_lint_cwindow = 0
set cursorline
hi CursorLine term=none cterm=none guibg=Grey40 ctermbg=0
:map <C-s> GVgg
:map <C-a> :w <Enter>
