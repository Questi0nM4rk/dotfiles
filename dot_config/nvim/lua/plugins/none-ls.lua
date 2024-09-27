return {
  "nvimtools/none-ls.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvimtools/none-ls-extras.nvim",
  },
  config = function()
    local null_ls = require("null-ls")
    local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

    -- Configure null-ls
    null_ls.setup({
      sources = {
        -- Lua
        null_ls.builtins.formatting.stylua.with({
          extra_args = { "--indent-type", "Spaces", "--indent-width", "2" }, -- example options
        }),

        -- Python
        null_ls.builtins.diagnostics.mypy,
        require("none-ls.diagnostics.ruff"),
        require("none-ls.formatting.ruff"),

        -- C/C++
        null_ls.builtins.formatting.clang_format,
        require("none-ls.diagnostics.cpplint"),
      },

      -- Attach formatting on save
      on_attach = function(client, bufnr)
        if client.supports_method("textDocument/formatting") then
          vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
          vim.api.nvim_create_autocmd("BufWritePre", {
            group = augroup,
            buffer = bufnr,
            callback = function()
              vim.lsp.buf.format({ bufnr = bufnr })
            end,
          })
        end
      end,
    })

    -- Manual format keybinding
    vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, { desc = "Get format" })
  end,
}
