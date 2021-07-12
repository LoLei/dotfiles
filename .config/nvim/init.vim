" -----------------------------------------------------------------------------
" PLUGINS
" -----------------------------------------------------------------------------
" Specify a directory for plugins
" - For Neovim: stdpath('data') . '/plugged'
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin(stdpath('data') . '/plugged')

" General
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-unimpaired'
Plug 'google/vim-maktaba'
Plug 'google/vim-codefmt'
Plug 'google/vim-glaive'
Plug 'alvan/vim-closetag'
Plug 'preservim/nerdtree'
Plug 'ryanoasis/vim-devicons'
" Plug 'lukas-reineke/indent-blankline.nvim', { 'branch': 'master' }
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install' }
Plug 'kyazdani42/nvim-web-devicons'

" Theme
" Plug 'dylanaraps/wal.vim'
Plug 'sprockmonty/wal.vim'
Plug 'morhetz/gruvbox'
Plug 'nanotech/jellybeans.vim'
Plug 'srcery-colors/srcery-vim'
Plug 'ayu-theme/ayu-vim'
Plug 'Glench/Vim-Jinja2-Syntax'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

" Telescope
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzy-native.nvim'

" LSP
Plug 'neovim/nvim-lspconfig'
Plug 'nvim-lua/lsp_extensions.nvim'
Plug 'nvim-lua/completion-nvim'

call plug#end()
call glaive#Install()

" -----------------------------------------------------------------------------
" GENERAL SETTINGS
" -----------------------------------------------------------------------------
syntax enable
set rnu

filetype plugin indent on
set clipboard+=unnamedplus
set showcmd
set shiftwidth=2
set softtabstop=2
set smartindent
set expandtab
set ruler
set backspace=2
set scrolloff=5
set textwidth=100
set mouse=a
set nowrap

" Themeing / colorscheme
set termguicolors     " enable true colors support

colorscheme wal

" let g:gruvbox_sign_column = 'bg0'
" let g:gruvbox_italic = '1'
" let g:gruvbox_bold = '1'
" let g:gruvbox_transparent_bg = '1'
" let g:gruvbox_contrast_dark = 'hard'
" colorscheme gruvbox

" let ayucolor="dark"   " for dark version of theme
" colorscheme ayu

" let g:srcery_italic = 1
" let g:srcery_bold = 1
" let g:srcery_underline = 1
" colorscheme srcery

hi CursorLineNr ctermfg=darkyellow
hi StatusLine ctermbg=none cterm=bold

" No automatic comment insertion on new line
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" Highlight tera files via jinja syntax
" Disable as it messes up indendation, but syntax highlighting still works
" autocmd BufNewFile,BufRead *.tera set ft=jinja

" Leader
let mapleader = "\<Space>"
let maplocalleader = "\\"

" Moving between windows
nnoremap <leader>wh :wincmd h<CR>
nnoremap <leader>wj :wincmd j<CR>
nnoremap <leader>wk :wincmd k<CR>
nnoremap <leader>wl :wincmd l<CR>

" Resizing windows
nnoremap <silent> <Leader>+ :vertical res +10<CR>
nnoremap <silent> <Leader>- :vertical res -10<CR>

" Spellcheck
map <F2> :setlocal spell! spelllang=en_us<CR>

" -----------------------------------------------------------------------------
" AUTOPAIRS
" -----------------------------------------------------------------------------
" Rebind auto-pairs toggle
let g:AutoPairsShortcutToggle = '<C-Ö>'

" -----------------------------------------------------------------------------
" FORMATTING
" -----------------------------------------------------------------------------
map <C-M-L> :FormatCode<CR>
map <C-M-P> :FormatCode prettier<CR>

" -----------------------------------------------------------------------------
" CLOSETAG
" -----------------------------------------------------------------------------
let g:closetag_filenames = '*.html,*.xhtml,*.phtml,*.jsx,*.tsx'
let g:closetag_xhtml_filenames = '*.xhtml,*.jsx,*.tsx'

" -----------------------------------------------------------------------------
" NERDTREE
" -----------------------------------------------------------------------------
nnoremap <leader>nn :NERDTree<CR>
nnoremap <leader>nfo :NERDTreeFocus<CR>
nnoremap <leader>nt :NERDTreeToggle<CR>
nnoremap <leader>nfi :NERDTreeFind<CR>
nnoremap <leader>nr :NERDTreeRefreshRoot<CR>

" Exit Vim if NERDTree is the only window left.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() |
    \ quit | endif

let g:NERDTreeShowHidden = 1
let g:NERDTreeHighlightCursorline = 0

" -----------------------------------------------------------------------------
" TELESCOPE
" -----------------------------------------------------------------------------

" telescope
" Find files using Telescope command-line sugar.
nnoremap <leader>ff <cmd>Telescope find_files hidden=true<cr>
nnoremap <leader>fr <cmd>Telescope file_browser<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fs <cmd>Telescope grep_string<cr>
nnoremap <leader>fz <cmd>Telescope current_buffer_fuzzy_find<cr>
nnoremap <leader>fb <cmd>Telescope buffers show_all_buffers=true sort_lastused=true ignore_current_buffer=true<cr>
nnoremap <leader>fo <cmd>Telescope oldfiles<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

" -----------------------------------------------------------------------------
" LSP
" A lot taken from: https://sharksforarms.dev/posts/neovim-rust/
" -----------------------------------------------------------------------------

" Set completeopt to have a better completion experience
" :help completeopt
" menuone: popup even when there's only one match
" noinsert: Do not insert text until a selection is made
" noselect: Do not select, force user to select one from the menu
set completeopt=menuone,noinsert,noselect

" Avoid showing extra messages when using completion
set shortmess+=c

" Configure LSP
" https://github.com/neovim/nvim-lspconfig#rust_analyzer
lua <<EOF
-- nvim_lsp object
local nvim_lsp = require('lspconfig')

-- function to attach completion when setting up lsp
local on_attach = function(client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  --Enable completion
  require'completion'.on_attach(client)

  -- Mappings
  local opts = { noremap=true, silent=true }

  -- See `:help vim.lsp.*` for documentation on any of the below functions
  buf_set_keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  buf_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
  buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  buf_set_keymap('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<space>wf', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
  buf_set_keymap('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  buf_set_keymap('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  buf_set_keymap('n', 'ga', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  buf_set_keymap('n', '<space>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
  buf_set_keymap('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
  buf_set_keymap('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
  buf_set_keymap('n', '<space>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)
  buf_set_keymap("n", "<space>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)

end

-- Use a loop to conveniently call 'setup' on multiple servers and
-- map buffer local keybindings when the language server attaches
local servers = { "rust_analyzer", "tsserver", "pyright" }
for _, lsp in ipairs(servers) do
  nvim_lsp[lsp].setup { on_attach = on_attach }
end

-- Servers with additional setup
nvim_lsp["yamlls"].setup {
  settings = {
    yaml = {
      schemas = { kubernetes = {"deployment.yaml", "statefulset.yaml", "/*secret.yaml"} },
    },
  },
  on_attach = on_attach
}

-- Enable diagnostics
vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics, {
    virtual_text = true,
    signs = true,
    update_in_insert = true,
  }
)
EOF

" Use <Tab> and <S-Tab> to navigate through popup menu
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" Use <Tab> as trigger keys
imap <Tab> <Plug>(completion_smart_tab)
imap <S-Tab> <Plug>(completion_smart_s_tab)

" Improve the diagnostics experience

" Set updatetime for CursorHold
" 300ms of no cursor movement to trigger CursorHold
set updatetime=300
" Show diagnostic popup on cursor hold
" autocmd CursorHold * lua vim.lsp.diagnostic.show_line_diagnostics()

" Goto previous/next diagnostic warning/error
nnoremap <silent> g[ <cmd>lua vim.lsp.diagnostic.goto_prev()<CR>
nnoremap <silent> g] <cmd>lua vim.lsp.diagnostic.goto_next()<CR>

" have a fixed column for the diagnostics to appear in
" this removes the jitter when warnings/errors flow in
set signcolumn=yes

" Enable type inlay hints
autocmd CursorMoved,InsertLeave,BufEnter,BufWinEnter,TabEnter,BufWritePost *
\ lua require'lsp_extensions'.inlay_hints{ prefix = '', highlight = "Comment", enabled = {"TypeHint", "ChainingHint", "ParameterHint"} }


" -----------------------------------------------------------------------------
" TREESITTER
" -----------------------------------------------------------------------------
lua <<EOF
require'nvim-treesitter.configs'.setup {
  ensure_installed = "maintained", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
  ignore_install = { }, -- List of parsers to ignore installing
  highlight = {
    enable = true,              -- false will disable the whole extension
    disable = { },  -- list of language that will be disabled
  },
  indent = {
    enable = true
  },
}
EOF

" -----------------------------------------------------------------------------
" INDENT-BLANKLINE
" -----------------------------------------------------------------------------
let g:indent_blankline_use_treesitter = v:true
let g:indent_blankline_show_current_context = v:true

" -----------------------------------------------------------------------------
" MARKDOWN-PREVIEW
" -----------------------------------------------------------------------------
let g:mkdp_browser = 'qutebrowser'
