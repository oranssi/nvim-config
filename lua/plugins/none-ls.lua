return {
  "nvimtools/none-ls.nvim",
  config = function()
    local null_ls = require("null-ls")
    null_ls.setup({
      sources = {
        null_ls.builtins.formatting.stylua,
        null_ls.builtins.formatting.prettier,
        null_ls.builtins.diagnostics.eslint_d,
        null_ls.builtins.diagnostics.eslint.with({
          prefer_local = "node_modules/.bin",
        }),
        null_ls.builtins.code_actions.eslint.with({
          prefer_local = "node_modules/.bin",
        }),
        null_ls.builtins.formatting.eslint.with({
          prefer_local = "node_modules/.bin",
        }),
      },
    })

    vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, {})
  end,
}
