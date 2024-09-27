return {
  "michaelrommel/nvim-silicon",
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    require("silicon").setup({
      font = "Hack Nerd Font Mono",
      theme = "Dracula",
    })
  end,
  keys = {
    {
      "<leader>sc",
      function()
        require("silicon").visualise_api()
      end,
      desc = "Capture code screenshot",
    },
  },
}
