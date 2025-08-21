return {
    {
        'nvim-lualine/lualine.nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons' },
        config = function()
            -- this is for my own spotipy plugin :)
            local status = require("neovim-spotify").status
            status:start()

            require("lualine").setup({
                options = { theme = "rose-pine" },
                sections = {
                    lualine_c = {
                        {
                            "filename",
                            path = 1
                        }
                    },

                    lualine_x = {
                        status.listen
                    },
                }
            })
        end
    }
}
