vim.g.lsp_zero_api_warning = 0
local lsp_zero = require('lsp-zero')

lsp_zero.on_attach(function(client, bufnr)
    local opts = { buffer = bufnr, remap = false }

    -- rename entire definition super importent
    vim.keymap.set("n", "<leader>rn", function() vim.lsp.buf.rename() end, opts)
    --vim.keymap.set("n", "<leader>s", function() vim.lsp.buf.format({bufnr = bufnr}) end)

    -- shows all references of instance
    vim.keymap.set("n", "<leader>ca", function() vim.lsp.buf.code_action() end, opts)
    vim.keymap.set("n", "<leader>ar", function() vim.lsp.buf.references() end, opts)
    vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)

    -- to go back from definition use <C-o>
    vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
    vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)

    local filetype = vim.api.nvim_buf_get_option(vim.api.nvim_get_current_buf(), 'filetype')
    if filetype == "java" or filetype == "rust" then
        vim.api.nvim_command("Copilot disable")
    end
end)


--  https://github.com/VonHeikemen/lsp-zero.nvim/blob/v3.x/doc/md/guides/integrate-with-mason-nvim.md
require('mason').setup({})
require('mason-lspconfig').setup({
    ensure_installed = { 'tsserver', 'rust_analyzer', 'gopls', 'lua_ls', 'jsonls', 'sqls', 'bashls', 'terraformls', 'pyright' },
    handlers = {
        function(server_name)
            require('lspconfig')[server_name].setup({})
        end,
    }
})

local cmp = require('cmp')
local cmp_select = { behavior = cmp.SelectBehavior.Select }

-- this is the function that loads the extra snippets to luasnip
require('luasnip.loaders.from_vscode').lazy_load()

cmp.setup({
    sources = {
        { name = 'path' },
        { name = 'nvim_lsp' },
        { name = 'luasnip' },
        { name = 'buffer' },
    },
    formatting = lsp_zero.cmp_format(),
    mapping = cmp.mapping.preset.insert({
        ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
        ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
        ['<Enter>'] = cmp.mapping.confirm({ select = true }),
        ['<Tab>'] = cmp.mapping.confirm({ select = true }),
        ['<C-Space>'] = cmp.mapping.complete(),
    }),
})
