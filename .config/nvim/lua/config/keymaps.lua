-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

vim.g.mapleader = " "

vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")

vim.keymap.set("n", "<leader>zm", vim.cmd.ZenMode)

vim.keymap.set("n", "<leader>T", vim.cmd.Telescope, { desc = "Telescope" })

vim.g.loaded_netrw = 0
vim.g.loaded_netrwPlugin = 0
