require "nvchad.options"

-- add yours here!

-- local o = vim.o
-- o.cursorlineopt ='both' -- to enable cursorline!

local map = vim.keymap.set

map('n', '<c-k>', ':wincmd k<CR>')
map('n', '<c-j>', ':wincmd j<CR>')
map('n', '<c-h>', ':wincmd h<CR>')
map('n', '<c-l>', ':wincmd l<CR>')
vim.opt.swapfile = false


