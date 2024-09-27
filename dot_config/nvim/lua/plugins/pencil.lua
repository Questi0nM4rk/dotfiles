return {
  "preservim/vim-pencil",
  config = function()
    vim.g["pencil#wrapModeDefault"] = "soft"
  end,
  keys = {
    { "<leader>pp", ":PencilToggle<CR>", desc = "Toggle Pencil mode" },
  },
}
