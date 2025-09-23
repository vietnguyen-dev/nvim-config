-- ~/.config/nvim/lua/plugins/conform.lua
return {
	"stevearc/conform.nvim",
	event = { "BufWritePre" }, -- load when saving
	config = function()
		-- If you install tools via Mason, make sure Conform can find them:
		-- (Do this once somewhere early in your config, e.g. init.lua)
		-- local mason_bin = vim.fn.stdpath("data") .. "/mason/bin"
		-- if not string.find(vim.env.PATH or "", mason_bin, 1, true) then
		--   vim.env.PATH = vim.env.PATH .. ":" .. mason_bin
		-- end

		require("conform").setup({
			-- Map filetypes to formatters (order = priority)
			formatters_by_ft = {
				-- TS / TSX
				typescript = { "prettier", "prettierd" },
				typescriptreact = { "prettier", "prettierd" }, -- TSX
				javascript = { "prettier", "prettierd" },
				javascriptreact = { "prettier", "prettierd" },

				-- vanilla html css
				html = { "prettier", "prettierd" },

				-- Go
				go = { "goimports", "gofumpt" }, -- goimports fixes imports; gofumpt enforces style

				-- SQL
				sql = { "sqlfluff" }, -- or { "pg_format" } if you prefer

				--PHP
				php = { "pretty-php" },
			},

			-- Autoformat on save
			format_on_save = {
				timeout_ms = 1000,
				lsp_fallback = true, -- use LSP if no formatter is found
			},
		})

		-- Optional manual keymap: <leader>f to format
		vim.keymap.set({ "n", "v" }, "<leader>f", function()
			require("conform").format({ async = true, lsp_fallback = true })
		end, { desc = "Format file (Conform)" })
	end,
}
