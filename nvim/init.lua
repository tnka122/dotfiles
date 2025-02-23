vim.g.mapleader = ' '
vim.opt.clipboard:append{'unnamedplus'}

vim.api.nvim_set_keymap('i', 'jj', '<ESC>', {silent=true})
vim.api.nvim_set_keymap('n', '<ESC><ESC>', ':nohlsearch<CR>', {silent=true})
vim.api.nvim_set_keymap('n', 'j', 'gj', {noremap = true})
vim.api.nvim_set_keymap('n', 'k', 'gk', {noremap = true})
vim.api.nvim_set_keymap('n', 'gk', 'k', {noremap = true})
vim.api.nvim_set_keymap('n', 'gj', 'j', {noremap = true})
