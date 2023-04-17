local builtin = require('telescope.builtin')

vim.keymap.set('n', '<C-space>', builtin.find_files, {})
vim.keymap.set('n', '<C-g>', builtin.live_grep, {})

require('telescope').load_extension('fzf')
