-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
-- This is also a good place to setup other settings (vim.opt)
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Absolute line number on current line, relative for others
vim.opt.number = true        -- show absolute line number on the current line
vim.opt.relativenumber = true -- show relative numbers on other lines

-- Ctrl-P to search files
vim.keymap.set("n", "<C-p>", function()
  require("telescope.builtin").find_files()
end, { desc = "Find files in cwd" })

vim.keymap.set("n", "<C-h>", function()
  require("telescope.builtin").find_files({ hidden = true })
end, { desc = "Find files (including hidden)" })

vim.keymap.set("n", "<C-g>", function()
  require("telescope.builtin").git_files()
end, { desc = "Find git files" })


-- Setup lazy.nvim
require("lazy").setup({
  spec = {
    -- import your plugins
    { import = "plugins" },
  },
  -- Configure any other settings here. See the documentation for more details.
  -- automatically check for plugin updates
  checker = { enabled = true },
})
