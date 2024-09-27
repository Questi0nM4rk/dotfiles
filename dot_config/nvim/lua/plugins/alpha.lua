return {
  "goolord/alpha-nvim",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
    "MaximilianLloyd/ascii.nvim",
    "MunifTanjim/nui.nvim",  -- nui.nvim for the popup
  },

  config = function()
    local alpha = require("alpha")
    local dashboard = require("alpha.themes.dashboard")
    local ascii = require("ascii")

    -- Set ASCII Art Header
    dashboard.section.header.val = ascii.art.text.neovim.sharp
    dashboard.section.header.opts = { position = "center" }

    -- Buttons from your original config
    dashboard.section.buttons.val = {
      dashboard.button("f", "󰈞  Find file", ":Telescope find_files <CR>"),
      dashboard.button("e", "  New file", ":ene <BAR> startinsert <CR>"),
      dashboard.button("r", "  Recently used files", ":Telescope oldfiles <CR>"),
      dashboard.button("t", "󱘣  Find text", ":Telescope live_grep <CR>"),
      dashboard.button("c", "  Configuration", ":e ~/.config/nvim/init.lua<CR>"),
      dashboard.button("p", "󰅫  Plugins list", ":e ~/.config/nvim/plugs<CR>"),
      dashboard.button("q", "󰈆  Quit Neovim", ":qa<CR>"),
    }

    dashboard.section.buttons.opts = { position = "center" }

    -- Highlight settings
    dashboard.section.header.opts.hl = "Include"
    dashboard.section.buttons.opts.hl = "Keyword"

    -- Ensure no autocommands trigger
    dashboard.opts.opts.noautocmd = true

    -- Apply Alpha setup with the modified dashboard
    alpha.setup(dashboard.opts)
  end,
}

