return {
  'saghen/blink.cmp',
  dependencies = {
      'rafamadriz/friendly-snippets',
      "echasnovski/mini.icons",
  },
  version = '*',
  opts = {
    keymap = { preset = 'default',
        ['<C-y>'] = { 'select_and_accept' },
        ['<C-j>'] = { 'select_next', 'fallback' },
        ['<C-k>'] = { 'select_prev', 'fallback' },
    },
    completion = {
        accept = { auto_brackets = { enabled = true } },
        menu = {
            draw = {
                components = {
                    kind_icon = {
                        ellipsis = false,
                        text = function (ctx)
                            local kind_icon, _, _ = require("mini.icons").get("lsp", ctx.kind)
                            return kind_icon
                        end,
                        highlight = function (ctx)
                            local _, hl, _ = require("mini.icons").get("lsp", ctx.kind)
                            return hl
                        end
                    }
                },
                columns = { { "label", "label_description", gap = 1 }, {"kind", "kind_icon", gap = 1}},
            }
        }
    },
    appearance = {
      use_nvim_cmp_as_default = true,
      nerd_font_variant = 'mono'
    },
    signature = { enabled = true },
    sources = {
      default = { 'lsp', 'path', 'snippets', 'buffer' },
    },
  },
  opts_extend = { "sources.default" }
}
