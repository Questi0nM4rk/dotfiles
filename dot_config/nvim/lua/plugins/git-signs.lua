return {
  "lewis6991/gitsigns.nvim",
  config = function()
    require("gitsigns").setup()
  end,
  keys = {
    {
      "<leader>gb",
      function()
        require("gitsigns").blame_line()
      end,
      desc = "Git blame current line",
    },
    {
      "<leader>gp",
      function()
        require("gitsigns").preview_hunk()
      end,
      desc = "Preview git hunk",
    },
  },
}
