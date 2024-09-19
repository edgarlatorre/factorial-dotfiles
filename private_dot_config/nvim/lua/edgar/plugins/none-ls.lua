return {
  "nvimtools/none-ls.nvim",
  dependencies = {
    "nvimtools/none-ls-extras.nvim",
  },
  config = function()
    local null_ls = require("null-ls")
    null_ls.setup({
      sources = {
        require("none-ls.diagnostics.eslint_d"),
        require("edgar.plugins.none-ls-custom.diagnostics.sempgrep"),
        null_ls.builtins.formatting.stylua,
        null_ls.builtins.formatting.prettier.with({
          filetypes = {
            "typescriptreact",
            "graphql",
            "javascript",
            "typescript",
            "json",
            "yaml",
            "markdown",
            "html",
            "css",
            "scss",
            "less",
            "ruby",
          },
        }),
        null_ls.builtins.diagnostics.erb_lint,
      },
    })

    vim.keymap.set("n", "<leader>ngf", vim.lsp.buf.format, {})
  end,
}
