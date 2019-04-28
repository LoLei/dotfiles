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
Plugin 'dylanaraps/wal.vim'
Plugin 'mboughaba/i3config.vim'
Plugin 'tpope/vim-surround'

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

" --------------------------------- OWN CONFIG ---------------------------------
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
colorscheme wal

" Show current function name
fun! ShowFuncName()
  let lnum = line(".")
  let col = col(".")
  echohl ModeMsg
  echo getline(search("^[^ \t#/]\\{2}.*[^:]\s*$", 'bW'))
  echohl None
  call search("\\%" . lnum . "l" . "\\%" . col . "c")
endfun
map <F1> :call ShowFuncName() <CR>

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
let g:ycm_confirm_extra_conf=0
nnoremap <F5>           :YcmForceCompileAndDiagnostics<CR>
nnoremap <leader>gt     :YcmCompleter GoTo<CR>
nnoremap <leader>gic    :YcmCompleter GoToInclude<CR>
nnoremap <leader>gdc    :YcmCompleter GoToDeclaration<CR>
nnoremap <leader>gdf    :YcmCompleter GoToDefinition<CR>
nnoremap <leader>gip    :YcmCompleter GoToImprecise<CR>
nnoremap <leader>fi     :YcmCompleter FixIt<CR>

" i3 config syntax highlighting
aug i3config_ft_detection
  au!
  au BufNewFile,BufRead ~/.config/i3/config set filetype=i3config
aug end

" requirements.txt syntax highlighting
autocmd BufNewFile,BufRead requirements*.txt set syntax=python
