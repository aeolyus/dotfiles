let mapleader = ';'

let g:vimwiki_list = [{'path': '~/vimwiki/',
                       \ 'syntax': 'markdown', 'ext': '.md'}]

if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
  silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

"Plugins
call plug#begin('~/.local/share/nvim/plugged')

Plug 'scrooloose/nerdtree'
Plug 'junegunn/vim-easy-align'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
"Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
"Plug 'nsf/gocode', { 'rtp': 'nvim', 'do': '~/.local/share/nvim/plugged/gocode/nvim/symlink.sh' }
"Plug 'fatih/vim-go', { 'do': ':GoInstallBinaries' }
"Plug 'zchee/deoplete-go', { 'do': 'make' }
Plug 'prettier/vim-prettier', { 'do': 'npm install', 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql'] }
Plug 'zchee/deoplete-jedi'
Plug 'xorkevin/yapf.vim', { 'for': 'python' }
Plug 'chriskempson/base16-vim'
Plug 'airblade/vim-gitgutter'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
"Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'
Plug 'vimwiki/vimwiki'

call plug#end()

set nocompatible
filetype plugin on
syntax on
set lazyredraw

set updatetime=500

set relativenumber
set number
set listchars=tab:\|\ ,trail:.,extends:>,precedes:<,nbsp:␣
set list
set tabstop=2
set shiftwidth=2
set expandtab
set conceallevel=2

:autocmd VimResized * wincmd =

"Colours
if filereadable(expand("~/.vimrc_background"))
  let base16colorspace=256
  source ~/.vimrc_background
endif

colorscheme base16-tomorrow-night

let g:airline_theme='base16'

"Deoplete
set completeopt+=noinsert
set completeopt+=noselect
set completeopt-=preview

let g:deoplete#enable_at_startup = 1
let g:deoplete#enable_camel_case = 1

let g:deoplete#sources#go#gocode_binary = $GOPATH.'/bin/gocode'
let g:deoplete#sources#go#sort_class = ['package', 'func', 'type', 'var', 'const']
let g:deoplete#sources#go#pointer = 1

"Prettier
let g:prettier#autoformat = 0
autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql Prettier

"YAPF
autocmd BufWritePre *.py YAPF

"Goyo
autocmd! User GoyoEnter Limelight
autocmd! User GoyoLeave Limelight!

"Keybindings
nmap <C-\> :NERDTreeToggle<CR>

nmap ga <Plug>(EasyAlign)
xmap ga <Plug>(EasyAlign)

nmap <C-p> :Files<CR>
nmap <C-o> :Buffers<CR>

inoremap <silent><expr><C-Space> deoplete#mappings#manual_complete()
imap <expr> <tab>   pumvisible() ? "\<c-n>" : "\<tab>"
imap <expr> <s-tab> pumvisible() ? "\<c-p>" : "\<tab>"
imap <expr> <cr>    pumvisible() ? deoplete#close_popup() : "\<cr>"

nmap <leader>g :Goyo<CR>
nmap <Leader>py <Plug>(Prettier)

nnoremap <leader><space> :nohlsearch<CR>
nnoremap <leader>d :bd<CR>
nnoremap <leader>s :w<CR>
