return {
  -- Mason setup
  {
    "williamboman/mason.nvim",
    lazy = false,
    config = function()
      require("mason").setup()
    end,
  },

  -- Mason LSP config setup
  {
    "williamboman/mason-lspconfig.nvim",
    lazy = false,
    config = function()
      local mason_lspconfig = require("mason-lspconfig")
      local lspconfig = require("lspconfig")

      -- Define the LSPs you want to auto-install
      local lsp_servers = {
        "lua_ls", -- Lua
        "bashls", -- Bash
        "clangd", -- C/C++
        "cmake", -- CMake
        "ltex", -- LaTex
        "marksman", -- Markdown
        "ruff", -- Python
        "pyright",
        "grammarly", -- Text
        "typos_lsp", -- Typos
      }

      -- Ensure that servers are installed
      mason_lspconfig.setup({
        ensure_installed = lsp_servers,
        automatic_installation = true,
      })

      -- Default capabilities
      local capabilities = require("cmp_nvim_lsp").default_capabilities()

      -- Set up each server with capabilities dynamically
      mason_lspconfig.setup_handlers({
        function(server_name)
          lspconfig[server_name].setup({
            capabilities = capabilities,
            -- Add any other global settings here, like on_attach
          })
        end,
      })
    end,
  },

  -- Mason DAP setup
  {
    "jay-babu/mason-nvim-dap.nvim",
    dependencies = {
      "mfussenegger/nvim-dap",
    },
    lazy = false,
    config = function()
      local mason_dap = require("mason-nvim-dap")

      -- Define the DAPs you want to auto-install
      local dap_servers = {
        "python", -- Python DAP
        "codelldb", -- C/C++/Rust DAP
      }

      mason_dap.setup({
        ensure_installed = dap_servers,
        automatic_installation = true,
      })
    end,
  },

  -- LSPconfig setup (additional configurations if needed)
  {
    "neovim/nvim-lspconfig",
    lazy = false,
    config = function()
      -- Mappings
      vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = "Show lsp buffer" })
      vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, { desc = "Get lsp definition" })
      vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, { desc = "Get lsp references" })
      vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "Code actions" })
    end,
  },
}
