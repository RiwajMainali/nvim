-- Disable compatibility with Vi
vim.opt.compatible = false

-- Enable line numbers
vim.opt.number = true

-- Enable syntax highlighting
vim.cmd('syntax enable')

-- Set the tab width to 4 spaces
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

-- Enable auto-indentation
vim.opt.autoindent = true

-- Enable mouse support
vim.opt.mouse = 'a'

-- Enable clipboard support
vim.opt.clipboard = 'unnamedplus'

-- Set the default encoding to UTF-8
vim.opt.encoding = 'utf-8'

-- Set the default file format to Unix
vim.opt.ffs = 'unix'

-- Set the default file encoding to UTF-8
vim.opt.fencs = 'utf-8'

-- Enable incremental search
vim.opt.incsearch = true

-- Enable case-insensitive search
vim.opt.ignorecase = true

-- Highlight search matches
vim.opt.hlsearch = true

-- Highlight current line
vim.opt.cursorline = true

-- Enable smart case search
vim.opt.smartcase = true

-- Enable showing the command line in the last line of the screen
vim.opt.cmdheight = 1

-- Enable showing the current mode in the command line
vim.opt.showmode = false

-- Set the status line to display the file path
vim.opt.statusline = '%f'

-- Enable displaying the line and column number in the status line
vim.opt.laststatus = 2

-- Set the colorscheme to default
vim.cmd('colorscheme default')

-- Map "jk" to exit insert mode
vim.api.nvim_set_keymap('i', 'jk', '<Esc>', { noremap = true })

-- Map "kj" to exit insert mode
vim.api.nvim_set_keymap('i', 'kj', '<Esc>', { noremap = true })

-- Enable relative line numbering
vim.opt.relativenumber = true

