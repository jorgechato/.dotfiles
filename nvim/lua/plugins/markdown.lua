return {
    {
        'MeanderingProgrammer/render-markdown.nvim',
        dependencies = {
            'nvim-treesitter/nvim-treesitter',
            'echasnovski/mini.nvim'
        }, -- if you use the mini.nvim suite
        ft = { "markdown", "codecompanion" },
        -- dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.icons' }, -- if you use standalone mini plugins
        -- dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' }, -- if you prefer nvim-web-devicons
        ---@module 'render-markdown'
        ---@type render.md.UserConfig
        opts = {},
    },
    {
        'nvim-telekasten/telekasten.nvim',
        dependencies = { 'nvim-telescope/telescope-media-files.nvim' },
        lazy = false,
        config = function()
            local home = vim.fn.expand('~/Library/CloudStorage/ProtonDrive-hack@jorgechato.com-folder/03 Personal/notes')
            local os = require("os")
            local year = os.date("%Y")
            local month = os.date("%m")

            require('telekasten').setup({
                home                = home,
                dailies             = home .. "/Log/" .. year .. "/" .. month,
                weeklies            = home .. "/Log/" .. year .. "/weekly",
                template_new_note   = home .. "/templates/note.md",
                template_new_daily  = home .. "/templates/daily.md",
                template_new_weekly = home .. "/templates/weekly.md",
                image_subdir        = "aseets",
                image_link_style    = "markdown",
                journal_auto_open   = false,
                plug_into_calendar  = true,
                calendar_opts       = {
                    -- calendar week display mode: 1 .. 'WK01', 2 .. 'WK 1', 3 .. 'KW01', 4 .. 'KW 1', 5 .. '1'
                    weeknm = 4,
                    -- use monday as first day of week: 1 .. true, 0 .. false
                    calendar_monday = 1,
                    -- calendar mark: where to put mark for marked days: 'left', 'right', 'left-fit'
                    calendar_mark = "left-fit",
                },
                subdirs_in_links    = true,
                rename_update_links = true,
                media_previewer     = "telescope-media-files",

                extension           = ".md",

                sort                = "filename",
                -- Tag notation: '#tag', '@tag', ':tag:', 'yaml-bare'
                tag_notation        = "#tag",
            })
        end
    },
}
