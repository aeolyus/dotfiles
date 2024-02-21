local opt = vim.opt
local g = vim.g

-- Be IMproved, required
opt.compatible = false
-- Disable cursor changing https://git.io/JfbFH
opt.guicursor = ""
-- For security
opt.modeline = false
-- Split horizontally and jump to the right
opt.splitbelow = true
-- Split vertically and jump down
opt.splitright = true
-- Ignore case of normal letters
opt.ignorecase = true
-- Ignore case when pattern contains lowercase letters only
opt.smartcase = true
-- Hide buffer when abandoned
-- Required for operations modifying multiple buffers
opt.hidden = true
-- Buffer screen updates
opt.lazyredraw = true
-- Time of inactivity before writing swap file to disk
opt.updatetime = 500 -- milliseconds
-- Show line numbers
opt.number = true
-- Set relative line numbering
opt.relativenumber = true
-- Visualize certain whitespace characters
opt.list = true
opt.listchars = "tab:| ,trail:.,extends:>,precedes:<,nbsp:␣"
-- Set indent to be 2 spaces
opt.shiftwidth = 2
-- Uses spaces to insert a tab
opt.expandtab = true
-- Lines with equal indent form a fold
opt.foldmethod = 'indent'
-- Start with no folds closed
opt.foldlevelstart = 99
-- Concealed text is hidden unless it has replacement defined
opt.conceallevel = 2
-- Hide mode message
opt.showmode = false
-- Suppress ins-completion-menu messages
opt.shortmess:append('c')
-- Enable mouse support
opt.mouse = 'a'
-- Highlight screen column 80
opt.colorcolumn = '80'

-- Suppress netrw history
g.netrw_dirhistmax = 0
