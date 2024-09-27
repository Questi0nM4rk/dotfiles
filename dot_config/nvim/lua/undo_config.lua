-- undo_config.lua

local M = {}

-- Function to save the undo tree to a file
M.save_undo_tree = function()
  local filename = vim.fn.expand("%:p")
  if filename == "" then
    vim.notify("No file to save undo history for.", vim.log.levels.ERROR)
    return
  end

  local undo_file = vim.fn.fnamemodify(filename, ":t")
  local undo_dir = vim.fn.expand("~/.config/nvim/.undodir/")
  local undo_path = undo_dir .. undo_file .. ".undo"

  vim.cmd("w")                           -- Save the file first
  vim.cmd("silent! wundo " .. undo_path) -- Save undo tree
  vim.notify("Undo history saved to: " .. undo_path, vim.log.levels.INFO)
end

-- Function to load the undo tree from a file
M.load_undo_tree = function()
  local filename = vim.fn.expand("%:p")
  if filename == "" then
    vim.notify("No file to load undo history for.", vim.log.levels.ERROR)
    return
  end

  local undo_file = vim.fn.fnamemodify(filename, ":t")
  local undo_dir = vim.fn.expand("~/.config/nvim/.undodir/")
  local undo_path = undo_dir .. undo_file .. ".undo"

  if vim.fn.filereadable(undo_path) == 1 then
    vim.cmd("silent! rundo " .. undo_path) -- Load undo tree
    vim.notify("Undo history loaded from: " .. undo_path, vim.log.levels.INFO)
  else
    vim.notify("No undo history found for: " .. filename, vim.log.levels.WARN)
  end
end

return M
