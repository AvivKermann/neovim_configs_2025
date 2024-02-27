require("thekermintor")

vim.cmd[[
    augroup transparent_splits
    autocmd!
    autocmd WinEnter * hi Normal ctermbg=none guibg=none
    autocmd WinLeave * hi Normal ctermbg=none guibg=none
    augroup END
    ]]

