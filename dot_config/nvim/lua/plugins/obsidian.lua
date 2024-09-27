return {
  "epwalsh/obsidian.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  config = function()
    require("obsidian").setup({
      dir = "~/ObsidianVault", -- Specify your Obsidian vault directory
    })
  end,
  keys = {
    { "<leader>on", ":ObsidianNew<CR>",    desc = "Create new Obsidian note" },
    { "<leader>oo", ":ObsidianOpen<CR>",   desc = "Open Obsidian note" },
    { "<leader>os", ":ObsidianSearch<CR>", desc = "Search Obsidian notes" },
  },
}
