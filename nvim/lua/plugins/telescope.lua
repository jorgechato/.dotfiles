return {
    {
        'nvim-telescope/telescope.nvim',
        cmd = 'Telescope',
        version = false,
        lazy = true,
        dependencies = {
            'nvim-lua/plenary.nvim',
            'nvim-tree/nvim-web-devicons',
            { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
            -- 'kkharji/sqlite.lua',
            'nvim-telescope/telescope-frecency.nvim',
        },
        config = function()
            local telescope = require('telescope')
            local actions = require('telescope.actions')
            local trouble = require("trouble.providers.telescope")

            telescope.setup {
                file_ignore_patterns = { "%.git/." },
                defaults = {
                    mappings = {
                        i = {
                            ["<esc>"] = actions.close,
                            ["<C-t>"] = trouble.open_with_trouble,
                        },

                        n = { ["<C-t>"] = trouble.open_with_trouble },
                    },
                    previewer = false,
                    hidden = true,
                    prompt_prefix = "   ",
                    file_ignore_patterns = { "node_modules", "package-lock.json" },
                    initial_mode = "insert",
                    select_strategy = "reset",
                    sorting_strategy = "ascending",
                    layout_strategy = "vertical",
                    layout_config = {
                        horizontal = {
                            width = 0.8,
                            height = 0.6,
                        },
                        vertical = {
                            width = 0.8,
                            height = 0.8,
                        },
                    },
                },
                pickers = {
                    find_files = {
                        previewer = false,
                        layout_config = {
                            vertical = {
                                height = 0.4,
                            },
                        },
                    },
                    git_files = {
                        previewer = false,
                        layout_config = {
                            vertical = {
                                height = 0.4,
                            },
                        },
                    },
                    buffers = {
                        mappings = {
                            i = {
                                ["<c-d>"] = actions.delete_buffer,
                            },
                            n = {
                                ["<c-d>"] = actions.delete_buffer,
                            },
                        },
                        initial_mode = "insert",
                    },
                    current_buffer_fuzzy_find = {
                        previewer = true,
                    },
                    live_grep = {
                        only_sort_text = false,
                        previewer = true,
                    },
                    lsp_references = {
                        show_line = false,
                        previewer = true,
                    },
                    treesitter = {
                        show_line = false,
                        previewer = true,
                    },
                },
                extensions = {
                    fzf = {
                        fuzzy = true,                   -- false will only do exact matching
                        override_generic_sorter = true, -- override the generic sorter
                        override_file_sorter = true,    -- override the file sorter
                        case_mode = "smart_case",       -- or "ignore_case" or "respect_case"
                    },
                    frecency = {
                        default_workspace = 'CWD',
                        show_scores = true,
                        show_unindexed = true,
                        disable_devicons = false,
                        ignore_patterns = {
                            "*.git/*",
                            "*/tmp/*",
                            "*/lua-language-server/*",
                        },
                    },
                }
            }
            telescope.load_extension('fzf')
            telescope.load_extension("frecency")
        end
    },
}
