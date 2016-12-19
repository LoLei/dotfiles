set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" " alternatively, pass a path where Vundle should install plugins
" "call vundle#begin('~/some/path/here')
"
" " let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" " The following are examples of different formats supported.
" " Keep Plugin commands between vundle#begin/end.
" " plugin on GitHub repo
Plugin 'tpope/vim-fugitive'
" " plugin from http://vim-scripts.org/vim/scripts.html
Plugin 'L9'
" " Git plugin not hosted on GitHub
Plugin 'git://git.wincent.com/command-t.git'
" " git repos on your local machine (i.e. when working on your own plugin)
Plugin 'file:///home/gmarik/path/to/plugin'
" " The sparkup vim script is in a subdirectory of this repo called vim.
" " Pass the path to set the runtimepath properly.
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
Plugin 'scrooloose/nerdtree'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'flazz/vim-colorschemes'
Plugin 'chriskempson/base16-vim'
" Plugin 'vim-airline/vim-airline'
" Plugin 'vim-airline/vim-airline-themes'
Plugin 'Valloric/YouCompleteMe'
Plugin 'rdnetto/YCM-Generator'
Plugin 'derekwyatt/vim-scala'
Plugin 'tacahiroy/ctrlp-funky'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'lervag/vimtex'
"
" " All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" " To ignore plugin indent changes, instead use:
" "filetype plugin on

" " Brief help
" " :PluginList       - lists configured plugins
" " :PluginInstall    - installs plugins; append `!` to update or just
" :PluginUpdate
" " :PluginSearch foo - searches for foo; append `!` to refresh local cache
" " :PluginClean      - confirms removal of unused plugins; append `!` to
" auto-approve removal
" "
" " see :h vundle for more details or wiki for FAQ
" " Put your non-Plugin stuff after this line
execute pathogen#infect()
syntax on
filetype plugin indent on
set clipboard=unnamedplus
set rnu
set wildmenu
" Fuzzy file finder
set runtimepath^=~/.vim/bundle/ctrlp.vim
set hidden

" Allow mouse usage
set mouse=a

" Use powerline font
" let g:airline_powerline_fonts = 1
" set timeoutlen=50

" Auto reload vimrc
augroup myvimrc
	au!
	au BufWritePost .vimrc,_vimrc,vimrc,.gvimrc,_gvimrc,gvimrc so $MYVIMRC | if has('gui_running') | so $MYGVIMRC | endif
augroup END

" Color scheme
set background=dark
set t_Co=256
colorscheme Tomorrow-Night-Edit

" Always show airline status bar
" set laststatus=2
" Hide vertical split windows bar
set fillchars+=vert:\ 
hi VertSplit ctermbg=0 ctermfg=0

" Transparent background
hi Normal ctermbg=none

" git
au FileType gitcommit set tw=72

" YCM
let g:ycm_min_num_of_chars_for_completion = 1
let g:ycm_auto_trigger = 1
let g:ycm_show_diagnostics_ui = 0
let g:ycm_confirm_extra_conf = 0

" Highlight current line
" let g:conoline_auto_enable = 1

" Show function name
fun! ShowFuncName()
  let lnum = line(".")
  let col = col(".")
  echohl ModeMsg
  echo getline(search("^[^ \t#/]\\{2}.*[^:]\s*$", 'bW'))
  echohl None
  call search("\\%" . lnum . "l" . "\\%" . col . "c")
endfun
map ö :call ShowFuncName() <CR>

" LaTeX
map <F3> :w !detex \| wc -w<CR>
map <F2> :setlocal spell! spelllang=en_us<CR>

" Wait until plugins are loaded
" autocmd VimEnter * ConoLineColorDark
" autocmd VimEnter * AirlineTheme base16_default


map <C-i> :NERDTreeToggle<CR>

set showcmd
" Map leader to space
let mapleader = " "
" Ctrl-P Funky fuzzy function finder
nnoremap <Leader>fu :CtrlPFunky<Cr>
" narrow the list down with a word under cursor
nnoremap <Leader>fU :execute 'CtrlPFunky ' . expand('<cword>')<Cr>
let g:ctrlp_funky_syntax_highlight = 1

set expandtab
set shiftwidth=2
set softtabstop=2
set smartindent

" Paste multiple times
xnoremap p pgvy

" PDF viewer for vim latex
let g:vimtex_view_method = 'zathura'

" Enable buffer view
" let g:airline#extensions#tabline#enabled = 1

