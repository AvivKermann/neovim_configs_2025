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
            })
            vim.notify = notify
        end
    }
}
