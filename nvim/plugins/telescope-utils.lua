return {
    {
        "ThePrimeagen/refactoring.nvim",
        dependencies = {
            { "nvim-lua/plenary.nvim" },
            { "nvim-treesitter/nvim-treesitter" }
        },
        config = function()
            require("refactoring").setup({})
        end
    },
    {
        "folke/trouble.nvim",
        cmd = { "TroubleToggle", "Trouble" },
        opts = { use_diagnostic_signs = true },
        lazy = true,
        config = function()
            require("trouble").setup {
                -- "workspace_diagnostics", "document_diagnostics", "quickfix", "lsp_references", "loclist"
                mode = "workspace_diagnostics",
                position = "bottom", -- position of the list can be: bottom, top, left, right
                height = 15,
                padding = false,
                action_keys = {
                    -- key mappings for actions in the trouble list
                    close = "q",                -- close the list
                    cancel = "<esc>",           -- cancel the preview and get back to your last window / buffer / cursor
                    refresh = "r",              -- manually refresh
                    jump = { "<cr>", "<tab>" }, -- jump to the diagnostic or open / close folds
                    open_split = { "<c-x>" },   -- open buffer in new split
                    open_vsplit = { "<c-v>" },  -- open buffer in new vsplit
                    open_tab = { "<c-t>" },     -- open buffer in new tab
                    jump_close = { "o" },       -- jump to the diagnostic and close the list
                    toggle_mode = "m",          -- toggle between "workspace" and "document" diagnostics mode
                    toggle_preview = "P",       -- toggle auto_preview
                    hover = "K",                -- opens a small popup with the full multiline message
                    preview = "p",              -- preview the diagnostic location
                    close_folds = { "zM" },     -- close all folds
                    open_folds = { "zR" },      -- open all folds
                    toggle_fold = { "za" },     -- toggle fold of current file
                },
                auto_jump = {},
                use_diagnostic_signs = true,
            }
        end
    },
    {
        "mfussenegger/nvim-dap",
        lazy = false,
        enabled = true,
        dependencies = {
            "rcarriga/nvim-dap-ui",
            "theHamsta/nvim-dap-virtual-text",
            "nvim-telescope/telescope-dap.nvim",
            "folke/neodev.nvim",
        },
        config = function()
            local dap = require("dap")
            local dapui = require("dapui")
            local virtual_text = require("nvim-dap-virtual-text")
            local dap_go = require("dap-go")

            dap.adapters.lldb = {
                type = 'executable',
                command = '/opt/homebrew/opt/llvm/bin/lldb-vscode', -- adjust as needed, must be absolute path
                name = 'lldb'
            }

            local lldb = {
                name = "Launch lldb",
                type = "lldb",      -- matches the adapter
                request = "launch", -- could also attach to a currently running process
                program = function()
                    return vim.fn.input(
                        "Path to executable: ",
                        vim.fn.getcwd() .. "/",
                        "file"
                    )
                end,
                cwd = "${workspaceFolder}",
                stopOnEntry = false,
                args = {},
                runInTerminal = false,
            }

            dap.configurations.rust = {
                lldb
            }

            dapui.setup()
            virtual_text.setup()
            dap_go.setup()
        end
    },

}
