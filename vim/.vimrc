" === Auto-install vim-plug ===
" Automatically download and install vim-plug if not present
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" === Plugins ===
call plug#begin('~/.vim/plugged')

" Surround text with quotes, brackets, tags (cs, ds, ys commands)
Plug 'tpope/vim-surround'

" Seamless navigation between tmux panes and vim splits (Ctrl + hjkl)
Plug 'christoomey/vim-tmux-navigator'

" Enable . repeat for plugin commands (works with vim-surround, etc.)
Plug 'tpope/vim-repeat'

" Catppuccin colorscheme (optional, for consistent look with neovim)
Plug 'catppuccin/vim', { 'as': 'catppuccin' }

call plug#end()

" === General ===
set nocompatible              " Disable Vi compatibility, enable Vim features
syntax enable                 " Enable syntax highlighting
filetype plugin indent on     " Enable filetype detection, plugins, and indent

" === Editor UI ===
if has('macunix')
  set number                    " Show absolute line numbers
  set relativenumber            " Show relative line numbers (hybrid with number)
endif
set cursorline                " Highlight the current line
set showmatch                 " Briefly jump to matching bracket when inserted
set signcolumn=yes            " Always show sign column (for git, diagnostics)
set scrolloff=8               " Keep 8 lines visible above/below cursor
set laststatus=2              " Always show status line (0=never, 1=only if split, 2=always)

" === Indentation ===
set tabstop=4                 " Number of spaces a <Tab> counts for
set shiftwidth=4              " Number of spaces for each indent level
set expandtab                 " Convert tabs to spaces
set smartindent               " Auto-indent based on syntax (e.g., after {)
set autoindent                " Copy indent from current line to new line

" === Search ===
set ignorecase                " Case-insensitive search
set smartcase                 " Case-sensitive if query contains uppercase
set incsearch                 " Show matches while typing search pattern
set hlsearch                  " Highlight all search matches

" === Convenience ===
" Use system clipboard (cross-platform)
if has('macunix')
  set clipboard=unnamed       " macOS: use * register (pbcopy/pbpaste)
elseif has('unix')
  set clipboard=unnamedplus   " Linux: use + register (xclip/xsel)
endif
set mouse=a                   " Enable mouse support in all modes
set splitright                " Open vertical splits to the right
set splitbelow                " Open horizontal splits below
set hidden                    " Allow switching buffers without saving
set nowrap                    " Don't wrap long lines (better for code)
set updatetime=250            " Faster CursorHold events (default 4000ms)
set ttimeoutlen=10            " Reduce key code delay (faster Esc response)

" === Encoding ===
set encoding=utf-8            " Internal encoding
set fileencoding=utf-8        " File encoding when writing

" === Colorscheme ===
set termguicolors             " Enable 24-bit RGB colors in terminal
set background=dark           " Use dark variant of colorscheme
silent! colorscheme catppuccin_mocha  " Apply colorscheme (silent! ignores error if not installed)

" === Keymaps ===
let mapleader = " "           " Set leader key to space

" Clear search highlighting with <leader>h
nnoremap <leader>h :nohlsearch<CR>

" Move selected lines down with J in visual mode
vnoremap J :m '>+1<CR>gv=gv

" Move selected lines up with K in visual mode
vnoremap K :m '<-2<CR>gv=gv

" Delete without overwriting default register (black hole register)
nnoremap <leader>d "_d
vnoremap <leader>d "_d

" Quick save with <leader>w
nnoremap <leader>w :w<CR>

" Quick quit with <leader>q
nnoremap <leader>q :q<CR>

" Navigate to next buffer
nnoremap <leader>bn :bnext<CR>

" Navigate to previous buffer
nnoremap <leader>bp :bprevious<CR>

" Close current buffer
nnoremap <leader>bd :bdelete<CR>

" Disable tmux navigator when zooming the Vim pane
let g:tmux_navigator_disable_when_zoomed = 1
