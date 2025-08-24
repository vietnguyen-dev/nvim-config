return {
	{
	"nvim-treesitter/nvim-treesitter",
	branch = 'master',
	lazy = false,
	build = ":TSUpdate",
	opts = {
	ensure_installed = { "go", "typescript", "tsx", "sql", "lua", "vim", "vimdoc" },
	highlight = { enable = true },
    },
    config = function(_, opts)
      require("nvim-treesitter.configs").setup(opts)
    end,
  },
}

