function ColorMyPencils(color)
	color = color or 'rose-pine'
	vim.cmd.colorscheme(color)
    vim.api.nvim_set_hl(0, 'Normal', { bg = 'none' })
	vim.api.nvim_set_hl(0, 'NormalFloat', { bg = 'none' })
    vim.cmd("highlight NetrwDir guifg=#ebbcba")
    vim.cmd("highlight netrwVersion guifg=#ebbcba")
    vim.cmd("highlight netrwList guifg=#ebbcba")


end

ColorMyPencils()
