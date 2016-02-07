syntax enable
colorscheme wargrey
set rnu

execute pathogen#infect()
let g:airline_powerline_fonts = 1
let g:airline_theme='ubaryd'
map <C-i> :NERDTreeToggle<CR>

set expandtab
set shiftwidth=2
set softtabstop=2
set smartindent

"Always show airline
set laststatus=2

"Remove pipe characters in vertical split bar
set fillchars+=vert:\ 
