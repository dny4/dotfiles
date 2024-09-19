-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

vim.g.mapleader = " "

-- move lines and indent
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")

vim.keymap.set("n", "<leader>zm", vim.cmd.ZenMode, { desc = "ZenMode" })

vim.keymap.set("n", "<leader>T", vim.cmd.Telescope, { desc = "Telescope" })

vim.keymap.set("n", "<leader>cts", vim.cmd.TailwindSort, { desc = "TailwindSort" })

vim.keymap.set("n", "<leader>hl", function()
  require("lualine").hide({ unhide = false })
  print("Lualine hidden")
end, { desc = "Hide lualine" })
vim.keymap.set("n", "<leader>hL", function()
  require("lualine").hide({ unhide = true })
  print("Lualine hidden")
end, { desc = "Unhide lualine" })
