local lspconfig = require('lspconfig')

lspconfig.tsserver.setup({
  -- Additional configuration specific to tsserver
  settings = {
    -- TypeScript configuration options
    typescript = {
      -- Enable/disable automatic type acquisitions
      enableAutoSync = true
    },
    -- JavaScript configuration options
    javascript = {
      -- Enable/disable automatic type acquisitions
      enableAutoSync = true
    },
    -- Optional configuration for CSS language server
    css = {
      validate = true
    },
    -- Optional configuration for HTML language server
    html = {
      validate = true
    }
  }
})

