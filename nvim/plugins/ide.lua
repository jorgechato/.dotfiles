return {
    {
        "kylechui/nvim-surround",
        version = "*", -- Use for stability; omit to use `main` branch for the latest features
        event = "VeryLazy",
    },
    {
        "lukas-reineke/indent-blankline.nvim",
        main = "ibl",
        opts = {},
        config = function()
            require("ibl").setup()
        end,
    },
    'tpope/vim-abolish',
    'MattesGroeger/vim-bookmarks',
    'ctrlpvim/ctrlp.vim',
    {
        "stevearc/oil.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        opts = {
            default_file_explorer = true,
            use_default_keymaps = false,
            keymaps = {
                ["<CR>"] = "actions.select",
                ["-"] = "actions.parent",
            },
            columns = {
                "icon",
            },
            view_options = {
                sort = {
                    { "type", "asc" },
                    { "name", "asc" },
                },
            },
            win_options = {
                wrap = false,
                signcolumn = "no",
                cursorcolumn = false,
                foldcolumn = "0",
                spell = false,
                list = false,
            },
            float = {
                winblend = 0,
                border = "none",
                padding = 5,
            },
        },
        init = function()
            vim.keymap.set("n", "-", require("oil").open, { desc = "Open parent directory" })
        end,
    },
    {
        'terrortylor/nvim-comment',
        config = function()
            require('nvim_comment').setup({
                line_mapping = "<C-_>",
                create_mappings = true,
            })
        end,
    },
    {
        "folke/todo-comments.nvim",
        enabled = true,
        dependencies = "nvim-lua/plenary.nvim",
        cmd = { "TodoTrouble", "TodoTelescope" },
        event = { "BufReadPost", "BufNewFile" },
        config = function()
            require("todo-comments").setup({
                keywords = {
                    FIX = { icon = " ", color = "error", alt = { "FIXME", "BUG", "FIXIT", "ISSUE" } },
                    TODO = { icon = " ", color = "info" },
                    HACK = { icon = " ", color = "warning" },
                    WARN = { icon = " ", color = "warning", alt = { "WARNING", "XXX" } },
                    PERF = { icon = "󰦬 ", alt = { "OPTIM", "PERFORMANCE", "OPTIMIZE" } },
                    NOTE = { icon = " ", color = "hint", alt = { "INFO" } },
                    TEST = { icon = "⏲ ", color = "test", alt = { "TESTING", "PASSED", "FAILED" } },
                },
                gui_style = {
                    fg = "NONE",                     -- The gui style to use for the fg highlight group.
                    bg = "BOLD",                     -- The gui style to use for the bg highlight group.
                },
                merge_keywords = true,               -- when true, custom keywords will be merged with the defaults
                highlight = {
                    multiline = true,                -- enable multine todo comments
                    multiline_pattern = "^.",        -- lua pattern to match the next multiline from the start of the matched keyword
                    multiline_context = 10,          -- extra lines that will be re-evaluated when changing a line
                    before = "",                     -- "fg" or "bg" or empty
                    keyword = "wide",                -- "fg", "bg", "wide", "wide_bg", "wide_fg" or empty.
                    after = "fg",                    -- "fg" or "bg" or empty
                    pattern = [[.*<(KEYWORDS)\s*:]], -- pattern or table of patterns, used for highlighting (vim regex)
                    comments_only = true,            -- uses treesitter to match keywords in comments only
                    max_line_len = 400,              -- ignore lines longer than this
                    exclude = {},                    -- list of file types to exclude highlighting
                },
                -- list of highlight groups or use the hex color if hl not found as a fallback
                colors = {
                    error = { "DiagnosticError", "ErrorMsg", "#DC2626" },
                    warning = { "DiagnosticWarn", "WarningMsg", "#FBBF24" },
                    info = { "DiagnosticInfo", "#2563EB" },
                    hint = { "DiagnosticHint", "#10B981" },
                    default = { "Identifier", "#7C3AED" },
                    test = { "Identifier", "#FF00FF" },
                },
            })
        end
    },
}
