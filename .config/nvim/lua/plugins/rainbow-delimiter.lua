return {
  "HiPhish/rainbow-delimiters.nvim",
  opts = {
    highlight = require "configs.highlight"
  },
  config = function (_,opts)
    require("rainbow-delimiters.setup").setup(opts)
  end
}
