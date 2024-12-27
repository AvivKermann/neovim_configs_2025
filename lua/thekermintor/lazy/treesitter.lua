return {
    "nvim-treesitter/nvim-treesitter",
    config = function()
        require('nvim-treesitter.configs').setup {
            ensure_installed = {"bash", "lua","java", "typescript","javascript","python","go", "markdown"},
            sync_install = false,
            auto_install = true,
            highlight = {
                enable = true,
            },
            additional_vim_regex_highlighting = true
        }
    end
}
