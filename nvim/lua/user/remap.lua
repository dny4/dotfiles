vim.g.mapleader = " "

vim.keymap.set("n", "<leader>w", vim.cmd.w)
vim.keymap.set("n", "<leader>q", vim.cmd.q)
vim.keymap.set("n", "<C-s>", vim.cmd.w)
vim.keymap.set("n", "<leader>wq", function()
    vim.cmd.w()
    vim.cmd.q()
end)


vim.keymap.set("n", "<leader>f", "<cmd>lua vim.lsp.buf.format()<CR>")

vim.keymap.set("n", "<leader>op", "<cmd>e ~/.config/nvim/lua/user/packer.lua<CR>")
vim.keymap.set("n", "<leader>oc", "<cmd>e ~/.config/nvim/<CR>")

vim.keymap.set("n", "<leader><leader><leader>", function()
    vim.cmd("so")
end)

vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")

vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
--vim.g.loaded_netrw = 1
--vim.g.loaded_netrwPlugin = 1
vim.keymap.set('n', '<leader>e', vim.cmd.NvimTreeToggle, {})
vim.keymap.set('n', '<leader>fe', vim.cmd.NvimTreeFocus, {})

vim.keymap.set('n', '<leader>zm', vim.cmd.ZenMode)

vim.keymap.set('n', '<leader>sc', function() 
    vim.cmd("set spell")
end)

vim.keymap.set('n', '<leader>rr', vim.cmd.reg)
