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
