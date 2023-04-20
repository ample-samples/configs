call plug#begin()
    " better cut, delete, and yank behaviour
    Plug 'tenxsoydev/karen-yank.nvim'

    " Indent guidlines
    Plug 'lukas-reineke/indent-blankline.nvim'

    "open URI with browser
    Plug 'tyru/open-browser.vim'

    "open repo on GitHub
    Plug 'https://github.com/tyru/open-browser-github.vim'

    " telescope file-browser
    Plug 'nvim-telescope/telescope-file-browser.nvim'

    " auto-session and telescope integration
    " Plug 'rmagatti/auto-session'
    " Plug 'rmagatti/session-lens'

    " fugitive for git integration
    Plug 'tpope/vim-fugitive'

    " colorizer for hex colours
    Plug 'norcalli/nvim-colorizer.lua'

    " live-server
    Plug 'aurum77/live-server.nvim'

    " use w, e and b to move through camelCase
    Plug 'https://github.com/bkad/CamelCaseMotion.git'
    
    " Change color of the line number based on the editing mode
    Plug 'mawkler/modicator.nvim'

    " Highlight cursor line and word under cursor
    Plug 'https://github.com/yamatsum/nvim-cursorline.git'

    " Smooth scrolling
    Plug 'declancm/cinnamon.nvim',

    " Create missing directories on file save
    Plug 'jghauser/mkdir.nvim'

    " useful for use with DAP ui
    Plug 'folke/neodev.nvim'

    " UI for nvim-dap
    Plug 'rcarriga/nvim-dap-ui'

    " Bufferline bar
    Plug 'akinsho/bufferline.nvim', { 'tag': 'v3.*' }

    " Discord rich-presence
    " Plug 'andweeb/presence.nvim'

    " DAP 
    Plug 'mfussenegger/nvim-dap'
    
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
    " Plug 'neoclide/coc.nvim', {'branch': 'release'}

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
    " For luasnip users.
    Plug 'L3MON4D3/LuaSnip'
    Plug 'saadparwaiz1/cmp_luasnip'
    Plug 'rafamadriz/friendly-snippets'
    Plug 'dcampos/cmp-emmet-vim'

    " Plug 'SirVer/ultisnips'
    " Plug 'quangnguyen30192/cmp-nvim-ultisnips'
    " End of nvim-cmp

call plug#end()

let mapleader=" "
" Start of keymaps
nnoremap <S-L> :bnext<CR>
nnoremap <S-H> :bprevious<CR>
nnoremap <C-B>c :bd<CR>

    " Nvim-tree
nnoremap <leader>t :NvimTreeFindFileToggle<CR>

    " DAP
nnoremap <F5> :lua require'dap'.continue()<CR>
nnoremap <F4> :lua require'dap'.toggle_breakpoint()<CR>
nnoremap <F7> :lua require'dap'.step_over()<CR>
nnoremap <F8> :lua require'dap'.step_into()<CR>
nnoremap <F6> :lua require("dapui").toggle()<CR>
nnoremap <F9> :lua require'dap'.step_out()<CR>

    " telescope
nnoremap <leader>b :Telescope buffers<CR>
nnoremap <leader>fg :Telescope git_files<CR>

" Luasnip
" inoremap <silent> <C-K> <cmd>lua ls.expand()<Cr>
" inoremap <silent> <C-L> <cmd>lua ls.jump(1)<Cr>
" inoremap <silent> <C-J> <cmd>lua ls.jump(-1)<Cr>
" snoremap <silent> <C-L> <cmd>lua ls.jump(1)<Cr>
" snoremap <silent> <C-J> <cmd>lua ls.jump(-1)<Cr>
" imap <silent><expr> <C-E> luasnip#choice_active() ? '<Plug>luasnip-next-choice' : ''
" smap <silent><expr> <C-E> luasnip#choice_active() ? '<Plug>luasnip-next-choice' : ''
" imap <silent><expr> <C-S-E> luasnip#choice_active() ? '<Plug>luasnip-prev-choice' : ''
" smap <silent><expr> <C-S-E> luasnip#choice_active() ? '<Plug>luasnip-prev-choice' : ''
  "
  " " press <Tab> to expand or jump in a snippet. These can also be mapped separately
  " " via <Plug>luasnip-expand-snippet and <Plug>luasnip-jump-next.
  " imap <silent><expr> <Tab> luasnip#expand_or_jumpable() ? '<Plug>luasnip-expand-or-jump' : '<Tab>' 
  " " -1 for jumping backwards.
  " inoremap <silent> <S-Tab> <cmd>lua require'luasnip'.jump(-1)<Cr>
  "
  " snoremap <silent> <Tab> <cmd>lua require('luasnip').jump(1)<Cr>
  " snoremap <silent> <S-Tab> <cmd>lua require('luasnip').jump(-1)<Cr>
  "
  " " For changing choices in choiceNodes (not strictly necessary for a basic setup).
  " imap <silent><expr> <C-E> luasnip#choice_active() ? '<Plug>luasnip-next-choice' : '<C-E>'
  " smap <silent><expr> <C-E> luasnip#choice_active() ? '<Plug>luasnip-next-choice' : '<C-E>'
" End luasnip

" CamelCaseMotion
" let g:camelcasemotion_key = '<leader>'

" nnoremap <F6> :lua require'dap'.repl.open()<CR>

" End of keymaps


" Use system clipboard
" set clipboard+=unnamedplus

" Auto-change directory to that of the currently opened file
autocmd BufEnter * lcd %:p:h

" Startify
nnoremap <leader>h :Startify<CR>

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
" set relativenumber

set termguicolors
colorscheme gruvbox
let g:airline_theme='base16_gruvbox_dark_soft'
highlight Normal guibg=none
highlight NonText guibg=none
highlight clear SignColumn


let g:bracey_server_port=5151

" Set ESLint as your plugging manager
let g:ale_fixers = {
    \ 'javascript': ['prettier-eslint'],
    \ 'html': ['prettier'],
    \ 'css': ['prettier'],
    \ 'typescript': ['prettier-eslint'],
    \'*': ['remove_trailing_lines', 'trim_whitespace'],
    \ }
let g:ale_sign_error = '❌'
let g:ale_sign_warning = '⚠️'

" b settings
set expandtab
set shiftwidth=2
set softtabstop=2
set tabstop=2
set autoindent
set scrolloff=5
set sidescrolloff=10
set cursorline

" Search and case
set ignorecase
set incsearch
set smartcase
set nohlsearch

" Disable autocommenting on new line
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o


source ~/.config/nvim/lua/init.lua
source ~/.config/nvim/lua/plugins/01treesitter.lua
" source ~/.config/nvim/lua/plugins/coc.lua
source ~/.config/nvim/lua/plugins/nvim_cmp.lua
source ~/.config/nvim/lua/plugins/autosave.lua
source ~/.config/nvim/lua/plugins/formatter.lua
source ~/.config/nvim/lua/plugins/windows.lua
source ~/.config/nvim/lua/plugins/DAP.lua
source ~/.config/nvim/lua/plugins/bufferline.lua
source ~/.config/nvim/lua/plugins/cinnamon.lua
source ~/.config/nvim/lua/plugins/cursorline.lua
source ~/.config/nvim/lua/plugins/CamelCaseMotion.vim
source ~/.config/nvim/lua/plugins/luasnip.lua
" source ~/.config/nvim/lua/plugins/presence.lua
source ~/.config/nvim/lua/plugins/live-server.lua
source ~/.config/nvim/lua/plugins/colorizer.lua
