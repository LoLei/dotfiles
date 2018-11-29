set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'jiangmiao/auto-pairs'
Plugin 'vim-syntastic/syntastic'
Plugin 'tacahiroy/ctrlp-funky'
Plugin 'Valloric/YouCompleteMe'

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

"------------------------------------------"
"Own config
" Small standard changes
syntax on
set clipboard=unnamedplus
set rnu
set wildmenu
set hidden
set showcmd
set expandtab
set shiftwidth=2
set softtabstop=2
set smartindent
set ruler
set backspace=2
set textwidth=80

" Auto reload vimrc
augroup myvimrc
	au!
	au BufWritePost .vimrc,_vimrc,vimrc,.gvimrc,_gvimrc,gvimrc so $MYVIMRC | if has('gui_running') | so $MYGVIMRC | endif
augroup END

" Paste multiple times
xnoremap p pgvy

" LaTeX
map <F3> :w !detex \| wc -w<CR>
map <F2> :setlocal spell! spelllang=en_us<CR>

" Colorscheme
colorscheme gruvbox8_hard

" Leader
"let mapleader=" "
"nnoremap <SPACE> <Nop>
let mapleader = "\<Space>"

" Ctrl-P Funky
nnoremap <Leader>fu :CtrlPFunky<Cr>
" narrow the list down with a word under cursor
nnoremap <Leader>fU :execute 'CtrlPFunky ' . expand('<cword>')<Cr>

" YCM
let g:ycm_global_ycm_extra_conf = '~/git/dotfiles/.ycm_extra_conf.py'
set completeopt-=preview
let g:ycm_show_diagnostics_ui = 0
let g:ycm_key_list_select_completion = ['<TAB>', '<Down>', '<c-j>' ]
let g:ycm_key_list_previous_completion = ['<S-TAB>', '<Up>', '<c-k>' ]
" Leader
"let mapleader=" "
"nnoremap <SPACE> <Nop>
let mapleader = "\<Space>"

" Ctrl-P Funky
nnoremap <Leader>fu :CtrlPFunky<Cr>
" narrow the list down with a word under cursor
nnoremap <Leader>fU :execute 'CtrlPFunky ' . expand('<cword>')<Cr>

" YCM
let g:ycm_global_ycm_extra_conf = '~/git/dotfiles/.ycm_extra_conf.py'
set completeopt-=preview
let g:ycm_show_diagnostics_ui = 0
let g:ycm_key_list_select_completion = ['<TAB>', '<Down>', '<c-j>' ]
let g:ycm_key_list_previous_completion = ['<S-TAB>', '<Up>', '<c-k>' ]
" Leader
"let mapleader=" "
"nnoremap <SPACE> <Nop>
let mapleader = "\<Space>"

" Ctrl-P Funky
nnoremap <Leader>fu :CtrlPFunky<Cr>
" narrow the list down with a word under cursor
nnoremap <Leader>fU :execute 'CtrlPFunky ' . expand('<cword>')<Cr>

" YCM
let g:ycm_global_ycm_extra_conf = '~/git/dotfiles/.ycm_extra_conf.py'
set completeopt-=preview
let g:ycm_show_diagnostics_ui = 0
let g:ycm_key_list_select_completion = ['<TAB>', '<Down>', '<c-j>' ]
let g:ycm_key_list_previous_completion = ['<S-TAB>', '<Up>', '<c-k>' ]
" Leader
"let mapleader=" "
"nnoremap <SPACE> <Nop>
let mapleader = "\<Space>"

" Ctrl-P Funky
nnoremap <Leader>fu :CtrlPFunky<Cr>
" narrow the list down with a word under cursor
nnoremap <Leader>fU :execute 'CtrlPFunky ' . expand('<cword>')<Cr>

" YCM
let g:ycm_global_ycm_extra_conf = '~/git/dotfiles/.ycm_extra_conf.py'
set completeopt-=preview
let g:ycm_show_diagnostics_ui = 0
let g:ycm_key_list_select_completion = ['<TAB>', '<Down>', '<c-j>' ]
let g:ycm_key_list_previous_completion = ['<S-TAB>', '<Up>', '<c-k>' ]
