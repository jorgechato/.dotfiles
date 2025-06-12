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
                                    -- default = "deepseek-coder:latest",
                                    -- default = "deepseek-coder-v2",
                                    default = "qwen2.5-coder:latest",
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
        "zbirenbaum/copilot.lua",
        enabled = true,
        cmd = "Copilot",
        event = "InsertEnter",
        config = function()
            require("copilot").setup({
                filetypes = {
                    markdown = true,
                },
                panel = {
                    enabled = true,
                    auto_refresh = true,
                    keymap = {
                        jump_next = "<c-j>",
                        jump_prev = "<c-k>",
                        refresh = "r",
                        open = "<M-CR>",
                    },
                    layout = {
                        position = "bottom", -- | top | left | right
                        ratio = 0.4,
                    },
                },
                suggestion = {
                    enabled = true,
                    auto_trigger = true,
                    debounce = 75,
                    keymap = {
                        accept = "<Tab>",
                        accept_word = false,
                        accept_line = false,
                        next = "<c-j>",
                        prev = "<c-k>",
                        dismiss = "<C-e>",
                    },
                },
            })
        end
    },
    {
        "zbirenbaum/copilot-cmp",
        after = { "copilot.lua" },
        config = function()
            require("copilot_cmp").setup()
        end,
    }
}
