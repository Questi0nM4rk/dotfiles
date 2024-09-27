return {
  "mbbill/undotree",
  config = function()
    vim.keymap.set("n", "<leader>uu", ":UndotreeToggle<CR>", { desc = "Toggle Undotree" })
    vim.api.nvim_set_keymap(
      "n",
      "<leader>su",
      ':lua require("undo_config").save_undo_tree()<CR>',
      { noremap = true, silent = true, desc = "Save Undo Tree" }
    )
  end,
}
