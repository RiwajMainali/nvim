-- Space as leader key
vim.g.mapleader = ' '

-- Shortcuts
vim.keymap.set({'n', 'x', 'o'}, '<leader>h', '^')
vim.keymap.set({'n', 'x', 'o'}, '<leader>l', 'g_')
vim.keymap.set('n', '<leader>a', ':keepjumps normal! ggVG<cr>')

-- Basic clipboard interaction
vim.keymap.set({'n', 'x'}, 'cp', '"+y')
vim.keymap.set({'n', 'x'}, 'cv', '"+p')

-- Delete text
vim.keymap.set({'n', 'x'}, 'x', '"_x')

-- Commands
vim.keymap.set('n', '<leader>w', '<cmd>write<cr>')
vim.keymap.set('n', '<leader>bq', '<cmd>bdelete<cr>')
vim.keymap.set('n', '<leader>bl', '<cmd>buffer #<cr>')

-- Map Esc to jk in insert mode
vim.api.nvim_set_keymap('i', 'jk', '<Esc>', { noremap = true })

-- Map Esc to kj in insert mode
vim.api.nvim_set_keymap('i', 'kj', '<Esc>', { noremap = true })

-- Define a mapping to switch between terminal and normal mode
vim.api.nvim_set_keymap('t', '<leader>j', '<C-\\><C-n><C-w>N', { noremap = true })
vim.api.nvim_set_keymap('n', '<Leader>k', '<C-w><C-w>', { noremap = true, silent = true })
