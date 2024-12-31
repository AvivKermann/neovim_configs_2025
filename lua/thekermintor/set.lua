
-- cursor stays large while typing
vim.opt.guicursor = ""
-- linenumbers
vim.opt.nu = true
vim.opt.relativenumber = true

-- indentation
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.g.netrw_bufsettings = 'noma nomod nu rnu nobl nowrap ro'
-- search
vim.opt.hlsearch = true
vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 10

vim.opt.updatetime = 50
vim.opt.cursorline=true

vim.o.ignorecase = true
vim.o.smartcase = true

-- Vertical line length at 120 and also sets the color to match rose pine (because its the best theme ever).
vim.opt.colorcolumn = "120"
-- Copilot no tab map
vim.g.copilot_no_tab_map = true

vim.cmd([[
    " Set 2 space indentation for Terraform files
    autocmd FileType terraform setlocal shiftwidth=2
    autocmd FileType terraform setlocal softtabstop=2
    autocmd FileType terraform setlocal expandtab
]])
vim.diagnostic.config({
    virtual_text = true,
    signs = true,
    severity_sort = true,
    float = {
        style = "minimal",
        border = "rounded",
        source = "always",
        focusable = false,
    },
})
