"Automate Plugins
if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
  silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

"Plugins
call plug#begin('~/.local/share/nvim/plugged')
Plug 'zchee/deoplete-jedi'
Plug 'scrooloose/nerdtree'
Plug 'chriskempson/base16-vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
Plug 'airblade/vim-gitgutter'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-fugitive'
Plug 'w0rp/ale'
call plug#end()

"General Settings
set nocompatible "be IMproved, required
filetype plugin on
syntax on
set lazyredraw
set updatetime=500
set number
set relativenumber
set list
set listchars=tab:\|\ ,trail:.,extends:>,precedes:<,nbsp:␣
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set conceallevel=2
set mouse=a
let mapleader = ';'

"Navigation
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
nnoremap <C-n> :tabnext<CR>
nnoremap <C-p> :tabprevious<CR>

"NerdTree
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1

autocmd VimResized * wincmd =

"Aesthetics
if filereadable(expand("~/.vimrc_background"))
  let base16colorspace=256
  source ~/.vimrc_background
endif
colorscheme base16-tomorrow-night
let g:airline_theme='base16'
let g:airline_symbols = {}
let g:airline_symbols.linenr = 'Ξ'
let g:airline_powerline_fonts = 1
let g:airline_skip_empty_sections = 1
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#branch#empty_message = ''
let g:airline#extensions#ale#enabled = 1
let g:airline#extensions#whitespace#symbol= '!'

"Ale
let g:ale_java_checkstyle_options = 'google_java_format'

"Deoplete
set completeopt+=noinsert
set completeopt+=noselect
set completeopt-=preview
let g:deoplete#enable_at_startup = 1
let g:deoplete#enable_camel_case = 1

"Goyo/Limelight
autocmd! User GoyoEnter Limelight
autocmd! User GoyoLeave Limelight!
nmap <leader>g :Goyo<CR>

"Terminal
tnoremap <Esc> <C-\><C-n>

"Keybindings
nmap <C-\> :NERDTreeToggle<CR>

nnoremap <C-Space> :FZF<CR>
inoremap <silent><expr><C-Space> deoplete#mappings#manual_complete()
imap <expr> <tab>   pumvisible() ? "\<c-n>" : "\<tab>"
imap <expr> <s-tab> pumvisible() ? "\<c-p>" : "\<tab>"
imap <expr> <cr>    pumvisible() ? deoplete#close_popup() : "\<cr>"

nnoremap <leader><space> :nohlsearch<CR>
nnoremap <leader>s :w<CR>
nnoremap <leader>y "+y
