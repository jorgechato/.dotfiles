return {
    {
        "olimorris/codecompanion.nvim",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-treesitter/nvim-treesitter",
        },
        config = function()
            require("codecompanion").setup({
                display = {
                    chat = {
                        diff = {
                            enabled = true,
                            close_chat_at = 240,  -- Close an open chat buffer if the total columns of your display are less than...
                            layout = "vertical",  -- vertical|horizontal split for default provider
                            opts = { "internal", "filler", "closeoff", "algorithm:patience", "followwrap", "linematch:120" },
                            provider = "default", -- default|mini_diff
                        },
                        slash_commands = {
                            ["file"] = {
                                callback = "strategies.chat.slash_commands.file",
                                description = "Select a file using Telescope",
                                opts = {
                                    provider = "telescope", -- Other options include 'default', 'mini_pick', 'fzf_lua'
                                    contains_code = true,
                                },
                            },
                        },
                    },
                },
                strategies = {
                    chat = {
                        adapter = "custom",
                    },
                    inline = {
                        adapter = "custom",
                        layout = "buffer",
                        keymaps = {
                            accept_change = {
                                modes = { n = "co" },
                                description = "Accept the suggested change",
                            },
                            reject_change = {
                                modes = { n = "kh" },
                                description = "Reject the suggested change",
                            },
                        },
                    },
                },
                adapters = {
                    custom = function()
                        return require("codecompanion.adapters").extend("ollama", {
                            name = "custom",
                            schema = {
                                model = {
                                    default = "qwen2.5-coder",
                                },
                                num_ctx = {
                                    default = 16384,
                                },
                                num_predict = {
                                    default = -1,
                                },
                            },
                        })
                    end,
                },
            })
        end,
    },
    {
        "Exafunction/codeium.nvim",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "hrsh7th/nvim-cmp",
        },
        config = function()
            require("codeium").setup({
                -- Optionally disable cmp source if using virtual text only
                enable_cmp_source = true,
                virtual_text = {
                    enabled = true,

                    -- Set to true if you never want completions to be shown automatically.
                    manual = false,
                    -- A mapping of filetype to true or false, to enable virtual text.
                    filetypes = {},
                    -- Whether to enable virtual text of not for filetypes not specifically listed above.
                    default_filetype_enabled = true,
                    -- How long to wait (in ms) before requesting completions after typing stops.
                    idle_delay = 75,
                    -- Priority of the virtual text. This usually ensures that the completions appear on top of
                    -- other plugins that also add virtual text, such as LSP inlay hints, but can be modified if
                    -- desired.
                    virtual_text_priority = 65535,
                    -- Set to false to disable all key bindings for managing completions.
                    map_keys = true,
                    -- The key to press when hitting the accept keybinding but no completion is showing.
                    -- Defaults to \t normally or <c-n> when a popup is showing.
                    accept_fallback = nil,
                    -- Key bindings for managing completions in virtual text mode.
                    key_bindings = {
                        -- Accept the current completion.
                        accept = "<Tab>",
                        -- Accept the next word.
                        accept_word = false,
                        -- Accept the next line.
                        accept_line = false,
                        -- Clear the virtual text.
                        clear = false,
                        -- Cycle to the next completion.
                        next = "<M-]>",
                        -- Cycle to the previous completion.
                        prev = "<M-[>",
                    }
                }
            })
        end
    },
}
