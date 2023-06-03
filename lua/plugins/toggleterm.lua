local Plugin = {'akinsho/toggleterm.nvim'}

Plugin.name = 'toggleterm'

Plugin.keys = {'<C-g>'}

-- See :help toggleterm-roadmap
Plugin.opts = {
  open_mapping = '<C-g>',
  direction = 'horizontal',
  shade_terminals = true,
}
vim.cmd('cd %:p:h')
return Plugin
