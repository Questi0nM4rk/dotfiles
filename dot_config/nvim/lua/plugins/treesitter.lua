return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      local tconfig = require("nvim-treesitter.configs")
      tconfig.setup({
        auto_install = true,
        highlight = {
          enable = true,
          additional_vim_regex_highlighting = true,
        },
        indent = {
          enable = true,
          disable = { "yaml" },
        },
      })
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter-textobjects",
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    config = function()
      require("nvim-treesitter.configs").setup({
        textobjects = {
          select = {
            enable = true,

            -- Automatically jump forward to textobj, similar to targets.vim
            lookahead = true,

            keymaps = {
              -- Functions
              ["af"] = "@function.outer", -- around a function
              ["if"] = "@function.inner", -- inside a function

              -- Classes
              ["ac"] = "@class.outer", -- around a class
              ["ic"] = "@class.inner", -- inside a class

              -- Loops
              ["al"] = "@loop.outer", -- around a loop
              ["il"] = "@loop.inner", -- inside a loop

              -- Conditions (if/switch)
              ["ai"] = "@conditional.outer", -- around a condition
              ["ii"] = "@conditional.inner", -- inside a condition

              -- Parameters
              ["ap"] = "@parameter.outer", -- around parameters
              ["ip"] = "@parameter.inner", -- inside parameters
            },
          },
          move = {
            enable = true,
            set_jumps = true, -- track movement in the jumplist

            -- Moving to the next/previous function, class, loop, condition, parameter
            goto_next_start = {
              ["]f"] = "@function.outer",    -- next function
              ["]c"] = "@class.outer",       -- next class
              ["]l"] = "@loop.outer",        -- next loop
              ["]p"] = "@parameter.outer",   -- next parameter
              ["]o"] = "@conditional.outer", -- next condition
            },
            goto_previous_start = {
              ["[f"] = "@function.outer",    -- previous function
              ["[c"] = "@class.outer",       -- previous class
              ["[l"] = "@loop.outer",        -- previous loop
              ["[p"] = "@parameter.outer",   -- previous parameter
              ["[o"] = "@conditional.outer", -- previous condition
            },
          },
          swap = {
            enable = true,
            swap_next = {
              ["<leader>sp"] = "@parameter.outer",   -- swap parameters
              ["<leader>sf"] = "@function.outer",    -- swap functions
              ["<leader>sc"] = "@class.outer",       -- swap classes
              ["<leader>sl"] = "@loop.outer",        -- swap loops
              ["<leader>so"] = "@conditional.outer", -- swap conditions
            },
            swap_previous = {
              ["<leader>sP"] = "@parameter.outer",   -- swap previous parameters
              ["<leader>sF"] = "@function.outer",    -- swap previous functions
              ["<leader>sC"] = "@class.outer",       -- swap previous classes
              ["<leader>sL"] = "@loop.outer",        -- swap previous loops
              ["<leader>sO"] = "@conditional.outer", -- swap previous conditions
            },
          },
        },
      })
    end,
  },
  {
    "HiPhish/rainbow-delimiters.nvim",
    config = function()
      require("rainbow-delimiters.setup").setup()
    end,
  },
}
