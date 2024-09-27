return {
  "folke/todo-comments.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    require("todo-comments").setup()
  end,
  keys = {
    { "<leader>tt", ":TodoTelescope<CR>", desc = "Show TODOs in Telescope" },
  },
}
