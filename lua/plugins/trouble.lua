-- plugins/trouble.lua
return {
  {
    "folke/trouble.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {
      icons = true,
      use_lsp_diagnostic_signs = true,
      auto_open = false,
      auto_close = true,
      modes = {
        preview_float = {
          mode = "diagnostics",  -- "workspace_diagnostics" or "document_diagnostics" also possible
          preview = {
            type = "float",
            relative = "editor",
            border = "rounded",
            title = "Preview",
            title_pos = "center",
            position = { 0, -2 },
            size = { width = 0.3, height = 0.3 },
            zindex = 1000,
          },
        },
      },
    },
  },
}

