return {
  "NeogitOrg/neogit",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "sindrets/diffview.nvim",
  },
  config = function()
    require("neogit").setup()
  end,
  keys = {
    {
      "<leader>gg",
      function()
        require("neogit").open()
      end,
      desc = "Open Neogit",
    },
    {
      "<leader>gc",
      function()
        require("neogit").open({ "commit" })
      end,
      desc = "Neogit commit",
    },
  },
}
