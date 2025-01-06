local function diff_source()
    local gitsigns = vim.b.gitsigns_status_dict
    if gitsigns then
        return {
            added = gitsigns.added,
            modified = gitsigns.changed,
            removed = gitsigns.removed
        }
    end
end

local function set_theme()
    local enabled = false
    local theme = vim.fn.system('defaults read -g AppleInterfaceStyle')
    if theme:match('Dark') or enabled == false then -- if not enabled by default dark mode
        vim.cmd('colorscheme github_dark_tritanopia')
    else
        vim.cmd('colorscheme github_light_tritanopia')
    end
end

return {
    {
        'projekt0n/github-nvim-theme',
        lazy = false,    -- make sure we load this during startup if it is your main colorscheme
        priority = 1000, -- make sure to load this before all the other start plugins
        config = function()
            require('github-theme').setup({
                specs = {
                    github_dark_tritanopia = { bg1 = "#101216" }
                },
            })
            set_theme()
        end,
    },
    {
        'nvim-lualine/lualine.nvim',
        lazy = false,
        event = { "BufReadPost", "BufNewFile", "VeryLazy" },
        config = function()
            require("lualine").setup({
                options = {
                    theme = "auto",
                    icons_enabled = true,
                    component_separators = { left = '', right = '' },
                    section_separators = { left = '', right = '' },
                    disabled_filetypes = {
                        statusline = {
                            'help',
                            'startify',
                            'dashboard',
                            'neo-tree',
                            'packer',
                            'neogitstatus',
                            'NvimTree',
                            'Trouble',
                            'alpha',
                            'lir',
                            'Outline',
                            'spectre_panel',
                            'toggleterm',
                            'qf',
                        },
                        winbar = {},
                    },
                },
                sections = {
                    lualine_a = {},
                    lualine_b = {},
                    lualine_c = {
                        {
                            "filename",
                            path = 1,
                            symbols = {
                                modified = "  ",
                                readonly = "",
                                unnamed = ""
                            }
                        },
                        { "diagnostics", sources = { "nvim_lsp" }, symbols = { error = " ", warn = " ", info = " " } },
                        { 'diff', source = diff_source },
                        { "searchcount" }
                    },
                    lualine_x = { { 'b:gitsigns_head', icon = '' } },
                    lualine_y = { 'filetype' },
                    lualine_z = {},
                },
                inactive_sections = {
                    lualine_a = {},
                    lualine_b = {},
                    lualine_c = { "filename" },
                    lualine_x = { "location" },
                    lualine_y = {},
                    lualine_z = {},
                },
                tabline = {
                    lualine_a = {
                        {
                            'tabs',
                            tab_max_length = 40,            -- Maximum width of each tab. The content will be shorten dynamically (example: apple/orange -> a/orange)
                            max_length = vim.o.columns / 3, -- Maximum width of tabs component.
                            mode = 1,
                            use_mode_colors = true,

                            show_modified_status = true, -- Shows a symbol next to the tab name if the file has been modified.
                            symbols = {
                                modified = '',
                            },
                            tabs_color = {
                                -- Same values as the general color option can be used here.
                                active = '', -- Color for active tab.
                            },
                        },
                    },
                    lualine_b = {},
                    lualine_c = {},
                    lualine_x = {},
                    lualine_y = {},
                    lualine_z = {}
                },
                extensions = { "neo-tree", "lazy" },
            })
        end,
    },
}
