local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
local null_ls = require "null-ls"

local formatting = null_ls.builtins.formatting
local linting = null_ls.builtins.diagnostics


null_ls.setup {
  sources = {
    formatting.prettier,
    formatting.blackd.with({
      filetypes = {"python"},
      command = {"blackd", "--bind-host", "127.0.0.1", "--bind-port", "45484"},
      debounce = true
    }),
    formatting.clang_format,
    linting.pylint
  },
  on_attach = function (client, bufnr)
    if client.supports_method("textDocument/formatting") then
      vim.api.nvim_clear_autocmds({
        group = augroup,
        buffer = bufnr
      })
      vim.api.nvim_create_autocmd("BufWritePre", {
        buffer = bufnr,
        group = augroup,
        callback = function ()
          vim.lsp.buf.format({bufnr = bufnr})
        end
      })
    end
  end,
}
