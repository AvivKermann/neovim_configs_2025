return {
    {
        "AvivKermann/neovim-spotify",
        dependencies = { "nvim-telescope/telescope.nvim" },
        build = ":UpdateRemotePlugins",
        config = function()
            require("neovim-spotify").setup({})
        end
    }
}
