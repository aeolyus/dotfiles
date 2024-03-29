vim.g.mapleader = ";"

-- General
vim.keymap.set("n", "<leader>s", ":w<CR>")
vim.keymap.set("n", "<leader>z", ":x<CR>")
vim.keymap.set("n", "<leader>x", ":xa<CR>")
vim.keymap.set("n", "<leader>q", ":qa<CR>")
vim.keymap.set("", "<leader>y", "\"+y")
vim.keymap.set("n", "<leader><leader>", ";")
vim.keymap.set("n", "<space><space>", ":buffer #<CR>")
vim.keymap.set("n", "<leader><space>", ":nohlsearch<CR>")
vim.keymap.set("n", "<leader>d", ":bp<bar>bd#<CR>")

-- Window Navigation
vim.keymap.set("n", "<leader>h", "<C-w>h")
vim.keymap.set("n", "<leader>j", "<C-w>j")
vim.keymap.set("n", "<leader>k", "<C-w>k")
vim.keymap.set("n", "<leader>l", "<C-w>l")
vim.keymap.set("n", "<leader>H", "<C-w>H")
vim.keymap.set("n", "<leader>J", "<C-w>J")
vim.keymap.set("n", "<leader>K", "<C-w>K")
vim.keymap.set("n", "<leader>L", "<C-w>L")
vim.keymap.set("n", "<C-H>", ":vertical resize -5<CR>")
vim.keymap.set("n", "<C-J>", ":resize +5<CR>")
vim.keymap.set("n", "<C-K>", ":resize -5<CR>")
vim.keymap.set("n", "<C-L>", ":vertical resize +5<CR>")

-- Tab Navigation
vim.keymap.set("n", "th", ":tabfirst<CR>")
vim.keymap.set("n", "tj", ":tabnext<CR>")
vim.keymap.set("n", "tk", ":tabprev<CR>")
vim.keymap.set("n", "tl", ":tablast<CR>")
vim.keymap.set("n", "td", ":tabclose<CR>")
vim.keymap.set("n", "tn", ":tabnew<CR>")

-- Use g[jk] for vertical movement in wrapped lines when no count is specified
vim.keymap.set("n", "<expr> k", "(v:count == 0 ? 'gk' : 'k'")
vim.keymap.set("n", "<expr> j", "(v:count == 0 ? 'gj' : 'j'")

-- Center searches
vim.keymap.set("n", "n", "nzz")
vim.keymap.set("n", "N", "Nzz")
vim.keymap.set("n", "*", "*N")

-- Get off my lawn
vim.keymap.set("n", "<Left>", 'h:echoerr "Use h"<CR>')
vim.keymap.set("n", "<Down>", 'j:echoerr "Use j"<CR>')
vim.keymap.set("n", "<Up>", 'k:echoerr "Use k"<CR>')
vim.keymap.set("n", "<Right>", 'l:echoerr "Use l"<CR>')

-- Diagnotics
vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float)
