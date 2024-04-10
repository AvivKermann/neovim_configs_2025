-- personal remaps

vim.g.mapleader = " "
vim.keymap.set("n", "<leader>af", vim.cmd.Ex)
vim.keymap.set("n", "<leader>s", vim.cmd.w)
vim.keymap.set("n", "<leader>sq", vim.cmd.wq)
vim.keymap.set("n", "<leader>f", function()
    vim.lsp.buf.format()
end)
vim.keymap.set('v', "Y", '"+yy')
vim.keymap.set("n", "<leader>qa", vim.cmd.q)
vim.api.nvim_set_keymap("n", "<leader>cmp", ":lua ColorMyPencils()<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>st", ":TransparentEnable<CR>", {noremap=true, silent=true})
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- window split verticlly  remap
vim.api.nvim_set_keymap("n", "<leader>|", "<C-w>v<C-w>l", {noremap = true})
vim.api.nvim_set_keymap("n", "<leader>-", "<C-w>s<C-w>j", {noremap = true})

-- closes the windows
vim.api.nvim_set_keymap("n", "<leader>cr", "<C-w>l<C-w>c", {noremap=true})
vim.api.nvim_set_keymap("n", "<leader>cl", "<C-w>h<C-w>c", {noremap=true})

-- switch between windows
vim.api.nvim_set_keymap("n", "<leader>L", "<C-w>l", {noremap = true})
vim.api.nvim_set_keymap("n", "<leader>H", "<C-w>h", {noremap = true})
vim.api.nvim_set_keymap("n", "<leader>J", "<C-w>j", {noremap = true})
vim.api.nvim_set_keymap("n", "<leader>K", "<C-w>k", {noremap = true})

-- clear search params
vim.api.nvim_set_keymap("n", "<leader>cs", ":noh<CR>", {noremap=true, silent=true})

-- remap copilot accept to the control c key
vim.api.nvim_set_keymap("i", "<C-c>", 'copilot#Accept("\\<CR>")', {expr = true,replace_keycodes = false })







