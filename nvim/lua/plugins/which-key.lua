return {
    "folke/which-key.nvim",
    event = "VeryLazy",
    lazy = true,
    opts = {
        preset = "modern",
        delay = function(ctx)
            return ctx.plugin and 0 or 800
        end,
        icons = {
            breadcrumb = "»", -- symbol used in the command line area that shows your active key combo
            separator = "➜", -- symbol used between a key and it's label
            group = "+", -- symbol prepended to a group
            mappings = false,
        },
        win = {
            border = "none",          -- none, single, double, shadow
            wo = {
                winblend = 0,         -- fully opaque
            },
            padding = { 2, 2, 2, 2 }, -- extra window padding [top, right, bottom, left]
            zindex = 1000,            -- positive value to position WhichKey above other floating windows.
        },
        layout = {
            height = { min = 4, max = 25 }, -- min and max height of the columns
            width = { min = 2, max = 50 },  -- min and max width of the columns
            spacing = 2,                    -- spacing between columns
            align = "center",               -- align columns left, center or right
        },
        replace = {
            ["<space>"] = "SPACE",
            ["<C>"] = "CTRL",
            ["<tab>"] = "TAB",
            ["<bs>"] = "BACK",
            ["<esc>"] = "ESC",
        },
        filter = function(mapping)
            -- exclude mappings without a description
            return mapping.desc and mapping.desc ~= ""
        end,
    },
    config = function(_, opts)
        local which_key = require("which-key")
        which_key.setup(opts)

        which_key.add(require('core.which-key.defaults'))

        which_key.add(require('core.which-key.non_leader'))
    end
}
