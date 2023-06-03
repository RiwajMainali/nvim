local Plugin = {'kyazdani42/nvim-tree.lua'}

Plugin.name = 'nvim-tree'

Plugin.cmd = {'NvimTreeToggle'}

-- See :help nvim-tree-setup
Plugin.opts = {
  hijack_cursor = false,
  on_attach = function(bufnr)
    local bufmap = function(lhs, rhs, desc)
      vim.keymap.set('n', lhs, rhs, {buffer = bufnr, desc = desc})
    end

    -- :help nvim-tree.api
    local api = require('nvim-tree.api')

    bufmap('L', api.node.open.edit, 'Expand folder or go to file')
    bufmap('H', api.node.navigate.parent_close, 'Close parent folder')
    bufmap('gh', api.tree.toggle_hidden_filter, 'Toggle hidden files')
  end
}

function Plugin.init()
  vim.keymap.set('n', '<leader>e', '<cmd>NvimTreeToggle<cr>')
	-- Move to the next buffer
vim.api.nvim_set_keymap('n', '.', ':bnext<CR>', { noremap = true, silent = true })

-- Move to the previous buffer
vim.api.nvim_set_keymap('n', ',', ':bprevious<CR>', { noremap = true, silent = true })

	end

return Plugin
