local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("vim-options")

-- Load the undo_config module
local undo_config = require("undo_config")

-- Autocommand to load undo tree when a file is opened
vim.api.nvim_create_autocmd("BufReadPost", {
  pattern = "*",
  callback = function()
    undo_config.load_undo_tree()
  end,
  desc = "Load undo tree when a file is opened",
})

require("lazy").setup("plugins")
