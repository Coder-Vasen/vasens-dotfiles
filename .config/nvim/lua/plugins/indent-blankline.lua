return {
  "lukas-reineke/indent-blankline.nvim",
  version = false,
  dependencies = {"rainbow-delimiters.nvim"},
  config = function (_, opts)
    local hooks = require "ibl.hooks"
    hooks.register(hooks.type.SCOPE_HIGHLIGHT,hooks.builtin.scope_highlight_from_extmark)
    require("ibl").setup(opts)
  end,
  opts = function ()
    return {
      scope = {
        enabled = true,
        show_start = true
      } 
    }
  end
}
