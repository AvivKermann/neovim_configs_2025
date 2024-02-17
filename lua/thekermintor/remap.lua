vim.g.mapleader = " "
vim.keymap.set("n", "<leader>af", vim.cmd.Ex)
vim.keymap.set("n", "<leader>s", vim.cmd.w)
vim.keymap.set("n", "<leader>qa", vim.cmd.q)
vim.api.nvim_set_keymap("n", "<leader>cmp",":lua ColorMyPencils()<CR>", {noremap= true, silent = true})

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")










