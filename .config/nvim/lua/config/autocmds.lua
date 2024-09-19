-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here
--
-- attach probuf lsp
-- vim.api.nvim_create_autocmd("BufEnter", {
--   group = vim.api.nvim_create_augroup("proto_lsp", { clear = true }),
--   pattern = { "protobuf", "proto" },
--   callback = function()
--     vim.lsp.start_client(vim.lsp.get_clients())
--   end,
-- })
--

vim.api.nvim_create_autocmd("FileType", {
  group = vim.api.nvim_create_augroup("proto_lsp", { clear = true }),
  pattern = { "proto" },
  callback = function()
    vim.lsp.stop_client(1)
    print("1 stooped")
  end,
})
