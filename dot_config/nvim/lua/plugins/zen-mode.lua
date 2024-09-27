return {
  "folke/zen-mode.nvim",
  config = function()
    require("zen-mode").setup()
  end,
  keys = {
    {
      "<leader>zz",
      function()
        require("zen-mode").toggle()
      end,
      desc = "Toggle Zen Mode",
    },
  },
}
