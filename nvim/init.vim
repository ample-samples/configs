call plug#begin()
    
    " Better . repeat
    Plug 'tpope/vim-repeat'

    " Leap for better movements
    Plug 'ggandor/leap.nvim'

    " Auto-close brackets
    Plug 'windwp/nvim-autopairs'

    " Window resize and animations
    Plug 'anuvyklack/middleclass'
    Plug 'anuvyklack/animation.nvim'

    " coc
    Plug 'neoclide/coc.nvim', {'branch': 'release'}

    " Rainbow brackets
    Plug 'https://github.com/mrjones2014/nvim-ts-rainbow.git'


    " easymotion for finding strings and characters
    Plug 'easymotion/vim-easymotion'

    " Telescope fuzzy finder fzf
    Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build' }

    " Deps for telescope-zoxide
    " Plug 'nvim-lua/popup.nvim'
    " Plug 'nvim-lua/plenary.nvim'
    " Plug 'jvgrootveld/telescope-zoxide'
    Plug 'nvim-telescope/telescope.nvim'

    " Auto close html tags
    Plug 'alvan/vim-closetag'

    " nvim tree file manager
    Plug 'nvim-tree/nvim-web-devicons' " optional, for file icons
    Plug 'nvim-tree/nvim-tree.lua'

    " REST
    Plug 'https://github.com/rest-nvim/rest.nvim.git'

    " Plenary
    Plug 'nvim-lua/plenary.nvim'

    " Formatter
    Plug 'mhartington/formatter.nvim'

    " Linter
    Plug 'dense-analysis/ale'

    " Vim Surround
    Plug 'tpope/vim-surround'

    " Live server for web deving
    Plug 'turbio/bracey.vim'

    " Treesitter
    Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

    " Nvim Surround
    Plug 'kylechui/nvim-surround'

    " HTML tag completion
    " Plug 'windwp/nvim-ts-autotag'

    " Live server for web deving
    " Plug 'aurum77/live-server.nvim'

    " Easy commenting
    Plug 'terrortylor/nvim-comment'

    " Startify
	Plug 'mhinz/vim-startify'

    " Colorscheme
	Plug 'ellisonleao/gruvbox.nvim'

    " AS
    Plug 'Pocco81/auto-save.nvim'

    " Emmet for rapid HTMLing
    Plug 'mattn/emmet-vim'

    " Airline
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'

    " Start of nvim-cmp
    Plug 'neovim/nvim-lspconfig'
    Plug 'hrsh7th/cmp-nvim-lsp'
    Plug 'hrsh7th/cmp-buffer'
    Plug 'hrsh7th/cmp-path'
    Plug 'hrsh7th/cmp-nvim-lua'
    Plug 'hrsh7th/cmp-cmdline'
    Plug 'hrsh7th/nvim-cmp'
    Plug 'williamboman/mason.nvim'
    Plug 'williamboman/mason-lspconfig.nvim'

    Plug 'SirVer/ultisnips'
    Plug 'quangnguyen30192/cmp-nvim-ultisnips'
    " End of nvim-cmp

call plug#end()

let mapleader=" "
" Keymaps
nnoremap <leader>t :NvimTreeFindFileToggle<CR>

" Use system clipboard
" set clipboard+=unnamedplus

" Center screen on enter Insert mode
autocmd InsertEnter * norm zz

" Basic settings
set ignorecase
set mouse=a
set smartcase
set number
set splitright
set nowrap
set title
set noerrorbells
set wildmenu

set termguicolors
colorscheme gruvbox
let g:airline_theme='base16_gruvbox_dark_soft'
highlight Normal guibg=none
highlight NonText guibg=none

let g:bracey_server_port=5151

" Set ESLint as your plugging manager
let g:ale_fixers = {
    \ 'javascript': ['prettier'],
    \ 'html': ['prettier'],
    \ 'css': ['prettier'],
    \'*': ['remove_trailing_lines', 'trim_whitespace'],
    \ }
let g:ale_sign_error = '❌'
let g:ale_sign_warning = '⚠️'

" b settings
set expandtab
set shiftwidth=4
set softtabstop=4
set tabstop=4
set autoindent
set scrolloff=12

" Search and case
set ignorecase
set incsearch
set smartcase
set nohlsearch
" Disable autocommenting on new line
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

source ~/.config/nvim/lua/init.lua
source ~/.config/nvim/lua/plugins/01treesitter.lua
source ~/.config/nvim/lua/plugins/coc.lua
source ~/.config/nvim/lua/plugins/nvim_cmp.lua
source ~/.config/nvim/lua/plugins/autosave.lua
source ~/.config/nvim/lua/plugins/formatter.lua
source ~/.config/nvim/lua/plugins/windows.lua

