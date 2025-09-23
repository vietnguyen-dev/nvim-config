-- plugins/lsp.lua
return {
  "neovim/nvim-lspconfig",
  config = function()
    local lspconfig = require("lspconfig")

    -- Attach the language servers you installed via Mason
    lspconfig.gopls.setup({})
    lspconfig.ts_ls.setup({})
    lspconfig.sqlls.setup({})
    -- Add more if you installed others, e.g. tailwindcss-language-server
    lspconfig.tailwindcss.setup({})
  end,
}
