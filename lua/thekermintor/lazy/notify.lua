return {
    {
        "rcarriga/nvim-notify",
        lazy = false,
        config = function()
            local notify = require("notify")
            notify.setup({
                stages = "fade",
                timeout = 50,
                fps = 60,
                background_colour = "#000000",
            })
            vim.notify = notify
            -- so the notification colors will be the same as rose pine
        end
    }
}
