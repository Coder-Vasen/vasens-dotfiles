-- This file  needs to have same structure as nvconfig.lua
-- https://github.com/NvChad/NvChad/blob/v2.5/lua/nvconfig.lua

---@type ChadrcConfig
local M = {}

M.ui = {
  theme = "nightfox",

  hl_override = {
    Comment = { italic = true },
    ["@comment"] = { italic = true },
  },
  transparency = true,
  nvdash = {
    load_on_startup = true,
  },
  statusline = {
    theme = "vscode_colored",
    modules = {
      cursor = function()
        return "%#StText# Ln %l, Col %c %#St_pos_icon# %#St_pos_text# %p %% "
      end,
    },
  },
  hl_add = {
    RainbowDelimiterRed = { fg = "#e78284" },
    RainbowDelimiterYellow = { fg = "#e5c890" },
    RainbowDelimiterBlue = { fg = "#85c1dc" },
    -- RainbowDelimiterOrange = {fg = "#"}
    RainbowDelimiterCyan = { fg = "#ef9f76" },
    -- RainbowDelimiterGreen = { fg = "#a6d189" },

    -- RainbowDelimiterGreen = { fg = "#85c05f" } 
    -- RainbowDelimiterViolet = { fg = "#7e7fc7" }, Darker shade
    RainbowDelimiterViolet = { fg = "#8c8dcd" },
  },
}

return M
