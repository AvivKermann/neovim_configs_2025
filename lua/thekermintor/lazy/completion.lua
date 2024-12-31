return {
    "saghen/blink.cmp",
    dependencies = {
        "rafamadriz/friendly-snippets",
        "echasnovski/mini.icons",
    },
    version = "*",
    opts = {
        keymap = {
            preset = "default",
            ["<C-y>"] = { "select_and_accept" },
            ["<C-j>"] = { "select_next", "fallback" },
            ["<C-k>"] = { "select_prev", "fallback" },
        },
        completion = {
            accept = {
                auto_brackets = {
                    enabled = true,
                },
            },
            documentation = {
                auto_show = true,
                treesitter_highlighting = true,
            },
            menu = {
                draw = {
                    components = {
                        kind_icon = {
                            ellipsis = false,
                            text = function(ctx)
                                return ctx.kind_icon .. ctx.icon_gap
                            end,
                            highlight = function(ctx)
                                return (
                                    require("blink.cmp.completion.windows.render.tailwind").get_hl(ctx)
                                    or "BlinkCmpKind"
                                ) .. ctx.kind
                            end,
                        },
                        kind = {
                            ellipsis = false,
                            text = function(ctx)
                                return "[" .. ctx.kind .. "]"
                            end,
                            highlight = function(ctx)
                                return (
                                    require("blink.cmp.completion.windows.render.tailwind").get_hl(ctx)
                                    or "BlinkCmpKind"
                                ) .. ctx.kind
                            end,
                        },
                        source_name = {
                            ellipsis = false,
                            text = function(ctx)
                                return "[" .. ctx.source_name .. "]"
                            end,
                        },
                    },
                    columns = { { "label" }, { "kind_icon", "kind" }, { "source_name", gap = 1 } },
                },
            },
        },
        appearance = {
            use_nvim_cmp_as_default = true,
            nerd_font_variant = "normal",
        },
        signature = {
            enabled = true,
            window = { treesitter_highlighting = true },
        },
        sources = {
            default = { "lsp", "path", "snippets", "buffer" },
        },
    },
    opts_extend = { "sources.default" },
}
