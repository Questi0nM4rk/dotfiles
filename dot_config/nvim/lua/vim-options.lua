-- Set relative line numbers
vim.wo.number = true
vim.wo.relativenumber = true

-- Use spaces instead of tabs
vim.bo.expandtab = true

-- Set the number of spaces that a <Tab> in the file counts for
vim.bo.tabstop = 2

-- Set the number of space characters inserted for indentation
vim.bo.shiftwidth = 2

-- Set the number of columns for a tab
vim.bo.softtabstop = 2

-- Global options (apply to all buffers)
vim.opt.expandtab = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.softtabstop = 2

-- Enable smart indenting
vim.opt.smartindent = true
vim.opt.autoindent = true

-- Disable swapfile
vim.opt.swapfile = false

-- Set leader
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Map 'jj' to escape in insert mode
vim.api.nvim_set_keymap("i", "jj", "<Esc>", { noremap = true })

-- Show whitespace characters
vim.opt.list = true
vim.cmd("set list listchars=trail:»,tab:»-")
vim.cmd("set fillchars+=vert:\\ ")

-- Other useful settings
vim.opt.hlsearch = true     -- Highlight search results
vim.opt.incsearch = true    -- Incremental search
vim.opt.ignorecase = true   -- Ignore case in search
vim.opt.smartcase = true    -- Don't ignore case if search pattern contains uppercase characters
vim.opt.scrolloff = 8       -- Keep 8 lines above/below the cursor when scrolling
vim.opt.hidden = true       -- Allow switching buffers without saving
vim.opt.backup = false      -- Disable backup files
vim.opt.writebackup = false -- Disable backup before overwriting a file
