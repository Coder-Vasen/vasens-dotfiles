require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

map("n", "<C-h>", ":TmuxNavigateLeft<CR>", {desc ="Window left"})
map("n", "<C-j>", ":TmuxNavigateDown<CR>", {desc = "Window down"})
map("n", "<C-k>", ":TmuxNavigateUp<CR>", {desc = "Window up"})
map("n", "<C-l>", ":TmuxNavigateRight<CR>", {desc = "Window right"})
-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
