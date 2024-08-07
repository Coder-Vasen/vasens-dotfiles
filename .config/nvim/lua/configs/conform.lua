local options = {
  formatters_by_ft = {
    lua = { "stylua" },
    css = { "prettier" },
    html = { "prettier" },
    typescript = {"prettier"},
    javascript = {"prettier"}
  },

  -- format_on_save = {
  --   -- These options will be passed to conform.format()
  --   timeout_ms = 500,
  --   lsp_fallback = true,
  -- },
  format_on_save = function (bufnr)
    if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
      return
    end
    return {timeout_ms = 500, lsp_fallback = true}
  end
}

require("conform").setup(options)

vim.api.nvim_create_user_command("FormatDisable", function (args)
  if args.bang then
    -- FormatDisable! will disable formatting just for thi buffer
    vim.b.disable_autoformat = true
  else
    vim.g.disable_autoformat = true
  end
end, {
    desc = "Disable autoformat-on-save",
    bang = true
  })

vim.api.nvim_create_user_command("FormatEnable", function ()
  vim.b.disable_autoformat = false
  vim.g.disable_autoformat = false
end, {
    desc =  "Re-enable autoformat-on-save"
  })
