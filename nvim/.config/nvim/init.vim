""" Automate Plugins
if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
  silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

""" Plugins
call plug#begin('~/.local/share/nvim/plugged')
" Autocompletion
Plug 'vim-test/vim-test'
Plug 'autozimu/LanguageClient-neovim', { 'branch': 'next', 'do': 'bash install.sh' }
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'Shougo/echodoc.vim'
" Text Manipulation
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
" Tools
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'lervag/vimtex'
Plug 'jamessan/vim-gnupg'
Plug 'junegunn/vim-easy-align'
Plug 'azadkuh/vim-cmus'
" Git
Plug 'tpope/vim-fugitive'
Plug 'mhinz/vim-signify'
" Writing
Plug 'junegunn/goyo.vim', {'on': 'Goyo'}
Plug 'junegunn/limelight.vim'
" Visuals
Plug 'lilydjwg/colorizer'
Plug 'sheerun/vim-polyglot'
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle'}
Plug 'Xuyuanp/nerdtree-git-plugin', { 'on': 'NERDTreeToggle'}
" Aesthetics
Plug 'arcticicestudio/nord-vim'
Plug 'chriskempson/base16-vim'
Plug 'vim-airline/vim-airline'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight', { 'on': 'NERDTreeToggle'}
Plug 'ryanoasis/vim-devicons', { 'on': 'NERDTreeToggle'}
call plug#end()

" Get off my lawn
nnoremap <silent> <Left>  h:echoe "Use h"<CR>
nnoremap <silent> <Right> l:echoe "Use l"<CR>
nnoremap <silent> <Up>    k:echoe "Use k"<CR>
nnoremap <silent> <Down>  j:echoe "Use j"<CR>

""" General Settings

" Be IMproved, required
set nocompatible
" Disable cursor changing https://git.io/JfbFH
set guicursor=
" For security
set nomodeline
" Load plugin files for specific file types
filetype plugin on
" Turn on syntax highlighting
syntax on
" Split horizontally and jump to right
set sb
" Split vertically and jump down
set spr
" Ignore case of normal letters
set ignorecase
" Ignore case when pattern contains lowercase letters only
set smartcase
" Hide buffer when abandoned
" Required for operations modifying multiple buffers
set hidden
" Buffer screen updates
set lazyredraw
" Time of inactivity before writing swap file to disk
set updatetime=500
" Show line numbers
set number
" Set relative line numbering
set relativenumber
" Visualize certain whitespace characters
set list lcs=tab:\|\ ,trail:.,extends:>,precedes:<,nbsp:␣
" Set indent to be 2 spaces
set shiftwidth=2
" Uses spaces to insert a <Tab>
set expandtab
" Lines with equal indent form a fold
set foldmethod=indent
" Start with no folds closed
set foldlevelstart=99
" Concealed text is hidden unless it has replacement defined
set conceallevel=2
" Hide mode message
set noshowmode
" Suppress ins-completion-menu messages
set shortmess+=c
" Enable mouse support
set mouse=a
" Minimal height of noncurrent windows
set winminheight=0
" Set leader key
let mapleader = ';'
" Suppress netrw history
let g:netrw_dirhistmax = 0

""" Navigation

" Window Navigation
nnoremap <silent> <leader>h <C-w>h
nnoremap <silent> <leader>j <C-w>j
nnoremap <silent> <leader>k <C-w>k
nnoremap <silent> <leader>l <C-w>l
nnoremap <silent> <leader>H <C-w>H
nnoremap <silent> <leader>J <C-w>J
nnoremap <silent> <leader>K <C-w>K
nnoremap <silent> <leader>L <C-w>L
nnoremap <silent> <C-H> :vertical resize -5<CR>
nnoremap <silent> <C-J> :resize +5<CR>
nnoremap <silent> <C-K> :resize -5<CR>
nnoremap <silent> <C-L> :vertical resize +5<CR>

" Tab Navigation
nnoremap <silent> th :tabfirst<CR>
nnoremap <silent> tj :tabnext<CR>
nnoremap <silent> tk :tabprev<CR>
nnoremap <silent> tl :tablast<CR>
nnoremap <silent> td :tabclose<CR>
nnoremap <silent> tn :tabnew<CR>

" Use g[jk] for vertical movement in wrapped lines when no count is specified
nnoremap <silent> <expr> k (v:count == 0 ? 'gk' : 'k')
nnoremap <silent> <expr> j (v:count == 0 ? 'gj' : 'j')

" Center searches
nnoremap <silent> n nzz
nnoremap <silent> N Nzz
nnoremap <silent> * *N

""" Plugin Configurations

" NerdTree
nnoremap <silent> <C-\> :NERDTreeToggle<CR>
nnoremap <leader>n :NERDTreeFind<CR>
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
" let NERDTreeQuitOnOpen = 1

" Aesthetics
let base16colorspace=256
colorscheme nord

" Airline
let g:airline_symbols = {}
let g:airline_symbols.linenr = 'Ξ'
let g:airline_powerline_fonts = 1
let g:airline_skip_empty_sections = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#branch#empty_message = ''
let g:airline#extensions#whitespace#symbol= '!'
let g:airline_left_sep=''
let g:airline_left_alt_sep=''
let g:airline_right_sep=''
let g:airline_right_alt_sep=''

" Deoplete
set completeopt+=noinsert
set completeopt+=noselect
set completeopt-=preview
let g:deoplete#enable_at_startup = 1
let g:deoplete#enable_camel_case = 1

" Echodoc
let g:echodoc#enable_at_startup = 1
let g:echodoc#type = 'floating'

" Goyo/Limelight
let g:limelight_conceal_ctermfg = 240
autocmd! User GoyoEnter Limelight
autocmd! User GoyoLeave Limelight!
nmap <silent> <silent> <leader>g :Goyo<CR>

" Vim-Go
let g:go_fmt_fail_silently = 1
let g:go_fmt_experimental=1

" Vimtex
let g:tex_flavor='latex'
let g:vimtex_view_method='zathura'
let g:vimtex_quickfix_latexlog = {'default' : 0}

" EasyAlign
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap <silent> ga <Plug>(EasyAlign)
" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap <silent> ga <Plug>(EasyAlign)

" Vimtest
let test#strategy = "neovim"
nnoremap <silent> <leader>t :TestNearest<CR>
nnoremap <silent> <leader>T :TestFile<CR>

" Terminal
au TermOpen * tnoremap <Esc> <c-\><c-n>
au FileType fzf tunmap <Esc>

" Keybindings
nnoremap <silent> <C-Space> :Files<CR>
nnoremap <silent> <C-g> :Rg<CR>
nnoremap <silent> <C-b> :Buffers<CR>
nnoremap <silent> <C-c> :Commands<CR>
nnoremap <silent> <space><space> :buffer #<CR>
nnoremap <silent> <leader><space> :nohlsearch<CR>
nnoremap <silent> <leader>/ :BLines<CR>
nnoremap <silent> <leader>d :bp<bar>bd#<CR>

nnoremap <silent> <leader>s :w<CR>
nnoremap <silent> <leader>z :x<CR>
nnoremap <silent> <leader>x :xa<CR>
nnoremap <silent> <leader>q :qa<CR>
noremap <silent> <leader>y "+y
nnoremap <silent> <leader><leader> ;
inoremap <silent> <expr><C-Space> deoplete#mappings#manual_complete()
imap <silent> <expr> <tab>   pumvisible() ? "\<c-n>" : "\<tab>"
imap <silent> <expr> <s-tab> pumvisible() ? "\<c-p>" : "\<tab>"
imap <silent> <expr> <cr>    pumvisible() ? deoplete#close_popup() : "\<cr>"

" Language specific settings
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab

" FZF
let $FZF_DEFAULT_COMMAND =  "rg --files --hidden 2>/dev/null"
let $FZF_DEFAULT_OPTS=' --color=dark
      \ --color=fg:15,bg:-1,hl:1,fg+:#ffffff,bg+:0,hl+:1
      \ --color=info:0,prompt:0,pointer:12,marker:4,spinner:11,header:-1
      \ --layout=reverse --margin=1,4'
" let g:fzf_layout = { 'window': 'call FloatingFZF()' }

function! FloatingFZF()
  let buf = nvim_create_buf(v:false, v:true)
  call setbufvar(buf, '&signcolumn', 'no')
  let height = float2nr(min([10, &lines/2]))
  let width = float2nr(min([80, &columns/2]))
  let horizontal = float2nr((&columns - width) / 2)
  let vertical = 2
  let opts = {
        \ 'relative': 'editor',
        \ 'row': vertical,
        \ 'col': horizontal,
        \ 'width': width,
        \ 'height': height,
        \ 'style': 'minimal'
        \ }
  call nvim_open_win(buf, v:true, opts)
endfunction


" Zoom/Restore window
function! s:ZoomToggle() abort
    if exists('t:zoomed') && t:zoomed
        execute t:zoom_winrestcmd
        let t:zoomed = 0
    else
        let t:zoom_winrestcmd = winrestcmd()
        resize
        vertical resize
        let t:zoomed = 1
    endif
endfunction
command! ZoomToggle call s:ZoomToggle()
nnoremap <silent> <C-w>o :ZoomToggle<CR>


" Language Server
let g:LanguageClient_serverCommands = {
    \ 'c': ['clangd'],
    \ 'cpp': ['clangd'],
    \ 'css': ['css-languageserver', '--stdio'],
    \ 'go': ['gopls'],
    \ 'html': ['html-languageserver', '--stdio'],
    \ 'java': ['jdtls', '--stdio'],
    \ 'javascript': ['javascript-typescript-stdio'],
    \ 'javascriptreact': ['javascript-typescript-stdio'],
    \ 'python': ['pylsp'],
    \ 'scala': ['metals-vim'],
    \ 'sh': ['bash-language-server', 'start'],
    \ 'tex': ['texlab'],
    \ 'typescript': ['javascript-typescript-stdio'],
    \ 'typescriptreact': ['javascript-typescript-stdio'],
    \ 'vim': ['vim-language-server', '--stdio'],
    \ }
nmap <silent> <F5> <Plug>(lcn-menu)
nmap <silent> K <Plug>(lcn-hover)
nmap <silent> <leader> e <Plug>(lcn-explain-error)
nmap <silent> gd <Plug>(lcn-definition)
nmap <silent> <F2> <Plug>(lcn-rename)
nmap <silent> <F3> <Plug>(lcn-references)
nmap <silent> <F4> <Plug>(lcn-format)
