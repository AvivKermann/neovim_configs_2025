function ColorMyPencils(color)
    color = color or "rose-pine-main"
    vim.cmd.colorscheme(color)
    vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
    vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
end

return {
    {
	"rose-pine/neovim",
	config = function()
        require("rose-pine").setup({
            extend_background_behind_borders = false,
            styles = {
                bold = false,
                italic = false,
                transparency = false,
            }
        })
        ColorMyPencils()
        vim.cmd("highlight NetrwDir guifg=#ebbcba")
        vim.cmd("highlight netrwVersion guifg=#ebbcba")
        vim.cmd("highlight netrwList guifg=#ebbcba")
        vim.cmd("highlight ColorColumn guibg=#393552")
	end
    },

}
