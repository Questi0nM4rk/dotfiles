return {
  "nosduco/remote-sshfs.nvim",
  dependencies = { "nvim-telescope/telescope.nvim" },

  config = function()
    local api = require("remote-sshfs.api")
    local connections = require("remote-sshfs.connections")

    require("remote-sshfs").setup({
      vim.keymap.set("n", "<leader>rc", api.connect, { desc = "SSH connect" }),
      vim.keymap.set("n", "<leader>rd", api.disconnect, { desc = "SSH disconnect" }),
      vim.keymap.set("n", "<leader>re", api.edit, { desc = "SSH edit" }),
    })

    if connections.is_connected() then
      vim.keymap.set("n", "<leader>ff", function()
        api.find_files()
      end, { desc = "SSH file grep while connected" })

      vim.keymap.set("n", "<leader>fg", function()
        api.live_grep()
      end, { desc = "SSH live grep while connected" })
    end

    require("telescope").load_extension("remote-sshfs")
  end,
}
