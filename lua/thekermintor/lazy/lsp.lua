--- Which ever servers will be in this table get installed.
local lsp_servers = {
    "pyright",
    "lua_ls",
    "lemminx",
}
return {
    "neovim/nvim-lspconfig",
    dependencies = {

        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
        "L3MON4D3/LuaSnip",
        "rafamadriz/friendly-snippets",
        "folke/lazydev.nvim",
        "saghen/blink.cmp",
    },
    config = function()
        local capabilities = require("blink.cmp").get_lsp_capabilities()
        require("mason").setup()
        require("mason-lspconfig").setup({
            ensure_installed = lsp_servers,
            automatic_installation = true,
            handlers = {
                function(server)
                    require("lspconfig")[server].setup({
                        capabilities = capabilities,
                    })
                end,
            },
        })

        vim.api.nvim_create_autocmd("BufWritePre", {
            pattern = { "*.py", "*.lua" },
            callback = function()
                vim.lsp.buf.format({ async = true })
            end,
        })

        require("luasnip.loaders.from_vscode").lazy_load()
    end,
}
