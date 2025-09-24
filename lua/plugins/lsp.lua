-- plugins/lsp.lua
return {
  "neovim/nvim-lspconfig",
  config = function()
    -- Common settings (optional: add keymaps, completion, etc.)
    local common = {
      -- on_attach = function(client, bufnr) ... end,
      -- capabilities = require("cmp_nvim_lsp").default_capabilities(),
    }

    -- Configure servers
    vim.lsp.config.gopls = vim.tbl_extend("force", common, {
      settings = {
        gopls = {
          analyses = { unusedparams = true },
          staticcheck = true,
        },
      },
    })

    vim.lsp.config.ts_ls = vim.tbl_extend("force", common, {
      -- settings = { ... }
    })

    vim.lsp.config.sqlls = vim.tbl_extend("force", common, {
      -- settings = { ... }
    })

    vim.lsp.config.tailwindcss = vim.tbl_extend("force", common, {
      -- settings = { ... }
    })

    -- Enable servers
    vim.lsp.enable("gopls")
    vim.lsp.enable("ts_ls")
    vim.lsp.enable("sqlls")
    vim.lsp.enable("tailwindcss")
  end,
}

