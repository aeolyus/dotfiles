require("nvim-tree").setup()
vim.keymap.set("n", "<C-\\>", ":NvimTreeToggle<CR>")
vim.keymap.set("n", "<leader>n", ":NvimTreeFindFile<CR>")
