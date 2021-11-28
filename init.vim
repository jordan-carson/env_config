set nocompatible
let mapleader = "\<Space>"
" =====================================
" # PLUGINS
" =====================================
" Load Manager
call plug#begin()
" Load Plugins

" GUI Enhancements & Highlight
" 	Statusline / Tabline plug
Plug 'itchyny/lightline.vim'
" 	Make the yanked region apparent
Plug 'machakann/vim-highlightedyank' 
" 	Mappings to move between Vim panes and tmux
Plug 'christoomey/vim-tmux-navigator'
" 	Quoting / Parenthesizing made simple surround.vim
Plug 'tpope/vim-surround'
" 	Allows to select multiple characters, create cursors, in Normal or
" 	Extended Mode
Plug 'mg979/vim-visual-multi', {'branch': 'master'}

" Semantic language support
" 	auto-completion and snippet integration - https://vimawesome.com/plugin/nvim-lspconfig
Plug 'neovim/nvim-lspconfig'
"Plug 'nvim-lua/lsp_extensions.nvim'
"	Chadtree is a 21st century NERDtree
Plug 'ms-jpq/chadtree', {'branch': 'chad', 'do': 'python3 -m chadtree deps'}
" 	Fast as Fuck nvim auto-completion
Plug 'ms-jpq/coq_nvim', {'branch': 'coq'}
Plug 'ms-jpq/coq.artifacts', {'branch': 'artifacts'}
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" Plug 'vim-test/vim-test'

" Git 
" 	wrapper / So awesome it should be illegal. :Git <command>
Plug 'tpope/vim-fugitive'
" 	shows a git diff in the sign column
Plug 'airblade/vim-gitgutter' 


" Fuzzy Finder Plugins " 
" 	Changes Vim working directory to project root.
Plug 'airblade/vim-rooter'
" 	Command Line fuzzy finder
Plug 'junegunn/fzf' , { 'dir': '~/.fzf','do': './install --all' }
Plug 'junegunn/fzf.vim'

" Plug 'preservim/tagbar'
" Plug 'rrethy/vim-hexokinase', { 'do': 'make hexokinase' }
" Plug 'hrsh7th/nvim-cmp'

" Editor enhancements
" Plug 'tpope/vim-commentary'
" Plug 'jiangmiao/auto-pairs'

" Syntactic language support 
" Plug 'cespare/vim-toml'
" Plug 'stephpy/vim-yaml'
" Plug 'plasticboy/vim-markdown'
" Plug 'rust-lang/rust.vim'
" Plug 'simrat39/rust-tools.nvim'
" 	Symantic Highlighting for Python in neovim
Plug 'numirias/semshi', {'do': ':UpdateRemotePlugins' }

" Formatters
" Plug 'psf/black', { 'branch': 'stable' }

" Optional Deps for Rust-Tools
" Plug 'nvim-lua/popup.nvim'
" Plug 'nvim-lua/plenary.nvim'
" Plug 'nvim-telescope/telescope.nvim'

" Theme
" Plug 'arcticicestudio/nord-vim'
Plug 'dracula/vim', {'as': 'dracula'}

call plug#end()

" RipGrep
if executable('rg')
	set grepprg=rg\ --nogroup
endif

" =====================================
" # Editor Settings
" =====================================
set encoding=utf-8
set mouse=a

set showmode showcmd
set number
set relativenumber
set autoindent

" Search
set incsearch
set smartcase
set ignorecase
set hlsearch

" Permanent undo
set undodir=~/.vimdid
set undofile

set showmatch
set noshowmode

" =====================================
" # Keyboard Shortcuts 
" =====================================
" No arrow keys
noremap <up> <nop>
noremap> <down> <nop>
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>

" Remap ESC to home row
inoremap kj <esc>
" nnoremap kj <esc>
" cnoremap kj <esc> 
" vnoremap kj <esc>

" Jump to start and end of line using how row keys
map H ^
map L $

" Search
noremap <leader>s :Rg 

" Clear search
nnoremap <silent> <CR> :noh<CR><CR>

" Left and right can switch buffers
nnoremap <left> :bp<CR>
nnoremap <right> :bn<CR>

" <leader><leader> toggle sbetween buffers
nnoremap <leader><leader> <c-^>

" Open new file adjacent to current file
nnoremap <leader>o :e <C-R>=expand("%:p:h") . "/" <CR>

" Center screen after jumping to line
nnoremap j jzz
nnoremap k kzz

" CHADTree Shortcut
nnoremap <leader>v <cmd>CHADopen<cr>

" Testing
nnoremap <silent> t<C-n> :TestNearest<CR>
nnoremap <silent> t<C-f> :TestFile<CR>
nnoremap <silent> t<C-s> :TestSuite<CR>
nnoremap <silent> t<C-l> :TestLast<CR>
nnoremap <silent> t<C-g> :TestVisit<CR>

" Tagbar
nmap <leader>t :TagbarToggle<CR>
"
" =====================================
" # GUI
" =====================================
let g:lightline = { 'colorscheme': 'dracula' }
let g:coq_settings = { 'auto_start': 'shut-up' }
let g:tagbar_ctags_bin = '/opt/homebrew/Cellar/universal-ctags/HEAD-0673dac/bin/ctags'

"Completion
set completeopt=menuone,noinsert,noselect
" Rust
" let g:rustfmt_autosave = 1
" let g:rustfmt_emit_files = 1
" let g:rustfmt_fail_silently = 0
" set updatetime=300

if (has("termguicolors"))
  set termguicolors
endif
" Set file update time
set updatetime=100

" Splits
set splitright
set splitbelow

" When closing terminal enter blank command so editor doesnt show
set t_te=""

" =====================================
" # Autocommands 
" =====================================
filetype on
" Rust
" au Filetype rust set colorcolumn=100

" Python
autocmd BufWritePre *.py execute ':Black'

" Type hints on showing file or buf - only on nightly
" autocmd BufEnter,BufWinEnter,TabEnter *.rs :lua require'lsp_extensions'.inlay_hints{}
" this is for lightline and other configs to ensure gui statusline works correctly
set t_Co=256 
