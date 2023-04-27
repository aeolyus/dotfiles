local telescope = require('telescope')
local builtin = require('telescope.builtin')

vim.keymap.set('n', '<C-space>', builtin.find_files, {})
vim.keymap.set('n', '<C-g>', builtin.live_grep, {})
vim.keymap.set('n', '<C-b>', builtin.buffers, {})
vim.keymap.set('n', '<C-c>', builtin.commands, {})

telescope.load_extension('fzf')
telescope.setup({
  pickers = {
    find_files = {
      hidden = true
    },
  },
})
