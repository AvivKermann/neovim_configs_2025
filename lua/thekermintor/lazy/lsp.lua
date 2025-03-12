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
        "jose-elias-alvarez/null-ls.nvim",
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

        --- Setup autocmd to format on save.
        vim.api.nvim_create_autocmd("BufWritePre", {
            pattern = { "*.py", "*.lua" },
            callback = function()
                vim.lsp.buf.format({ async = true })
            end,
        })
        --- Setup formatters for different languages.
        local null_ls = require("null-ls")
        null_ls.setup({
            sources = {
                null_ls.builtins.formatting.black.with({
                    extra_args = { "--fast" },
                }),
                null_ls.builtins.formatting.stylua,
            },
        })

        require("luasnip.loaders.from_vscode").lazy_load()
    end,
}
