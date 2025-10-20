local util  = require 'lspconfig.util'
local icons = require('core.icons')

return {
    {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v4.x',
        lazy = true,
    },
    {
        'williamboman/mason.nvim',
        lazy = false,
        config = true,
    },

    -- Autocompletion
    {
        'hrsh7th/nvim-cmp',
        event = 'InsertEnter',
        dependencies = {
            { 'L3MON4D3/LuaSnip' },
            { 'onsails/lspkind.nvim' },
        },
        config = function()
            require('lsp-zero.cmp').extend()

            local cmp         = require('cmp')
            local lspkind     = require('lspkind')
            local cmp_mapping = cmp.mapping
            local luasnip     = require('luasnip')
            cmp.setup({
                formatting = {
                    fields = { "kind", "abbr", "menu" },
                    format = function(entry, vim_item)
                        local max_width = 0
                        if max_width ~= 0 and #vim_item.abbr > max_width then
                            vim_item.abbr = string.sub(vim_item.abbr, 1, max_width - 1) .. icons.ui.Ellipsis
                        end
                        -- vim_item.kind = lspkind.presets.default[vim_item.kind] .. " " .. vim_item.kind

                        if entry.source.name == "copilot" then
                            vim_item.kind = icons.git.Copilot
                            vim_item.kind_hl_group = "CmpItemKindCodeium"
                        end

                        if entry.source.name == "crates" then
                            vim_item.kind = icons.misc.Package
                            vim_item.kind_hl_group = "CmpItemKindCrate"
                        end

                        if entry.source.name == "emoji" then
                            vim_item.kind = icons.misc.Smiley
                            vim_item.kind_hl_group = "CmpItemKindEmoji"
                        end
                        vim_item.menu = ({
                            nvim_lsp = "(LSP)",
                            emoji = "(Emoji)",
                            path = "(Path)",
                            calc = "(Calc)",
                            vsnip = "(Snippet)",
                            luasnip = "(Snippet)",
                            buffer = "(Buffer)",
                            tmux = "(TMUX)",
                            copilot = "(Copilot)",
                            treesitter = "(TreeSitter)",
                        })[entry.source.name]
                        vim_item.dup = ({
                            buffer = 1,
                            path = 1,
                            nvim_lsp = 0,
                            luasnip = 1,
                            copilot = 0,
                        })[entry.source.name] or 0
                        return vim_item
                    end,
                },
                snippet = {
                    expand = function(args)
                        luasnip.lsp_expand(args.body)
                    end,
                },
                window = {
                    completion = cmp.config.window.bordered({
                        winhighlight = "Normal:Normal,FloatBorder:FloatBorder,CursorLine:PmenuSel,Search:None",
                    }),
                    documentation = cmp.config.window.bordered({
                        winhighlight = "Normal:Normal,FloatBorder:FloatBorder,CursorLine:PmenuSel,Search:None",
                    }),
                },
                sources = {
                    {
                        name = "copilot",
                        max_item_count = 3,
                        trigger_characters = {
                            {
                                ".",
                                ":",
                                "(",
                                "'",
                                '"',
                                "[",
                                ",",
                                "#",
                                "*",
                                "@",
                                "|",
                                "=",
                                "-",
                                "{",
                                "/",
                                "\\",
                                "+",
                                "?",
                                " ",
                                -- "\t",
                                -- "\n",
                            },
                        },
                    },
                    {
                        name = "nvim_lsp",
                        entry_filter = function(entry, ctx)
                            local kind = require("cmp.types.lsp").CompletionItemKind[entry:get_kind()]
                            if kind == "Snippet" and ctx.prev_context.filetype == "java" then
                                return false
                            end
                            if kind == "Text" then
                                return false
                            end
                            return true
                        end,
                    },

                    { name = "path" },
                    { name = "luasnip" },
                    { name = "nvim_lua" },
                    { name = "buffer" },
                    { name = "calc" },
                    { name = "emoji" },
                    { name = "treesitter" },
                    { name = "crates" },
                    { name = "tmux" },
                    { name = "copilot" },
                },
                mapping = {
                    -- ['<Tab>'] = cmp_action.luasnip_supertab(),
                    -- ['<S-Tab>'] = cmp_action.luasnip_shift_supertab(),
                    ["<C-Space>"] = cmp_mapping.complete(),
                    ['<CR>'] = cmp.mapping.confirm({ select = false }),
                }
            })
        end
    },

    -- LSP
    {
        'neovim/nvim-lspconfig',
        cmd = 'LspInfo',
        event = { 'BufReadPre', 'BufNewFile' },
        dependencies = {
            { 'hrsh7th/cmp-nvim-lsp' },
            { 'williamboman/mason-lspconfig.nvim' },
            { 'b0o/schemastore.nvim' },
            { 'WhoIsSethDaniel/mason-tool-installer.nvim' }
        },
        config = function()
            local lsp_zero = require('lsp-zero')

            require('mason').setup({
                ui = {
                    icons = {
                        package_installed = "",
                        package_pending = "",
                        package_uninstalled = "",
                    },
                }
            })
            require('mason-tool-installer').setup {
                ensure_installed = {
                    'sqlfmt',
                },
            }

            local capabilities = require('cmp_nvim_lsp').default_capabilities()

            -- Diagnostics UI
            local signs = icons.diagnostics
            for type, icon in pairs(signs) do
                local hl = 'DiagnosticSign' .. type
                vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
            end

            vim.diagnostic.config({
                virtual_text = true,
                float = {
                    focusable = false,
                    style = "minimal",
                    border = "rounded",
                    source = "always",
                    header = "",
                    prefix = "",
                },
            })

            -- Configure LSP servers using new vim.lsp.config API
            vim.lsp.config.lua_ls = {
                settings = {
                    Lua = {
                        workspace = {
                            library = vim.api.nvim_get_runtime_file("", true),
                            checkThirdParty = false,
                        },
                        hint = { enable = true },
                        telemetry = { enable = false },
                    },
                },
            }

            vim.lsp.config.tailwindcss = {
                capabilities = capabilities,
                filetypes = { "html", "css", "scss", "javascript", "javascriptreact", "typescript", "typescriptreact", "astro", "astro-markdown", "gohtml", "gohtmltmpl", "markdown", "mdx", "templ", "vue", "svelte" },
                init_options = { userLanguages = { templ = "html" } },
            }

            vim.lsp.config.jsonls = {
                settings = {
                    json = {
                        schema = require('schemastore').json.schemas(),
                        validate = { enable = true },
                    }
                }
            }

            vim.lsp.config.ts_ls = {
                root_dir = vim.fs.root(0, { "package.json", "tsconfig.json", "jsconfig.json" }),
                filetypes = { "javascript", "javascriptreact", "javascript.jsx", "typescript", "typescriptreact", "typescript.tsx", 'vue', 'svelte' },
            }

            vim.lsp.config.eslint = {
                filetypes = { "javascript", "javascriptreact", "javascript.jsx", "typescript", "typescriptreact", "typescript.tsx", 'vue', 'svelte' },
                settings = {
                    workingDirectory = { mode = 'auto' },
                    format = { enable = true },
                    lint = { enable = true },
                },
                on_attach = function(client, bufnr)
                    vim.api.nvim_create_autocmd("BufWritePre", {
                        buffer = bufnr,
                        callback = function(ctx)
                            -- Apply ESLint fixes using code actions
                            vim.lsp.buf.code_action({
                                context = { only = { "source.fixAll.eslint" }, diagnostics = {} },
                                apply = true,
                            })

                            -- Notify svelte language server if applicable
                            if client.name == "svelte" then
                                client.notify("$/onDidChangeTsOrJsFile", { uri = ctx.file })
                            end
                        end,
                    })
                end,
            }

            vim.lsp.config.sqlls = {
                filetypes = { 'sql', 'mysql', 'postgres' },
            }

            vim.lsp.config.gopls = {
                filetypes = { 'go', 'gomod', 'gowork', 'gotmpl' },
                root_dir = vim.fs.root(0, { "go.mod", ".git", "go.work" }),
                settings = {
                    gopls = {
                        gofumpt = true,
                        codelenses = {
                            gc_details = false,
                            generate = true,
                            regenerate_cgo = true,
                            run_govulncheck = true,
                            test = true,
                            tidy = true,
                            upgrade_dependency = true,
                            vendor = true,
                        },
                        hints = {
                            assignVariableTypes = true,
                            compositeLiteralFields = true,
                            compositeLiteralTypes = true,
                            constantValues = true,
                            functionTypeParameters = true,
                            parameterNames = true,
                            rangeVariableTypes = true,
                        },
                        analyses = {
                            fieldalignment = false,
                            nilness = true,
                            unusedparams = true,
                            unusedwrite = true,
                            useany = true,
                        },
                        usePlaceholders = true,
                        completeUnimported = true,
                        staticcheck = true,
                        directoryFilters = { "-.git", "-.vscode", "-.idea", "-.vscode-test", "-node_modules" },
                    }
                }
            }

            vim.lsp.config.terraformls = {
                filetypes = { "terraform", "tf", "terraform-vars", "hcl" },
                root_dir = vim.fs.root(0, { "*.tf", "*.terraform", "*.tfvars", "*.hcl", "*.config" }),
            }

            vim.lsp.config.marksman = {
                root_dir = vim.fs.root(0, { ".git", ".marksman.toml" }),
                single_file_support = true,
                init_options = {
                    typescript = {},
                },
            }

            vim.lsp.config.astro = {
                root_dir = vim.fs.root(0, { "package.json", "tsconfig.json", "jsconfig.json", ".git" }),
                init_options = {
                    typescript = {},
                },
            }

            vim.lsp.config.typos_lsp = {
                filetypes = { '*' },
                init_options = {
                    diagnosticSeverity = 'Warning',
                },
            }

            vim.lsp.config.svelte = {
                cmd = { 'svelteserver', '--stdio' },
                root_dir = vim.fs.root(0,
                    { 'svelte.config.js', 'svelte.config.cjs', 'package.json', 'tsconfig.json', 'jsconfig.json', '.git' }),
                filetypes = { 'svelte' },
            }

            vim.lsp.config.rust_analyzer = {
                capabilities = capabilities,
                root_dir = vim.fs.root(0, { "Cargo.toml" }),
                settings = {
                    ['rust_analyzer'] = {
                        cargo = {
                            allFeatures = true,
                        },
                    },
                },
            }

            vim.lsp.config.html = {}
            vim.lsp.config.spectral = {}
            vim.lsp.config.templ = {}
            vim.lsp.config.htmx = {}
            vim.lsp.config.cmake = {}
            vim.lsp.config.dockerls = {}
            vim.lsp.config.cssls = {}
            vim.lsp.config.dagger = {}
            vim.lsp.config.rnix = {}
            vim.lsp.config.zls = {}
            vim.lsp.config.taplo = {}

            -- Setup Mason LSP installer
            require('mason-lspconfig').setup({
                ensure_installed = {
                    'sqlls',
                    'spectral',
                    'lua_ls',
                    'rust_analyzer',
                    'gopls',
                    'templ',
                    'htmx',
                    'cmake',
                    'jsonls',
                    'terraformls',
                    'dockerls',
                    'ts_ls',
                    'eslint',
                    'astro',
                    'cssls',
                    'tailwindcss',
                    'marksman',
                    'typos_lsp',
                    'dagger',
                    'rnix',
                    'zls',
                    'taplo',
                    'svelte',
                    'html',
                },
            })

            -- Enable all LSP servers
            local servers = {
                'sqlls', 'spectral', 'lua_ls', 'rust_analyzer', 'gopls', 'templ', 'htmx',
                'cmake', 'jsonls', 'terraformls', 'dockerls', 'ts_ls', 'eslint', 'astro',
                'cssls', 'tailwindcss', 'marksman', 'typos_lsp', 'dagger', 'rnix', 'zls',
                'taplo', 'svelte'
            }

            for _, server in ipairs(servers) do
                vim.lsp.enable(server)
            end

            -- Set up keymaps when LSP attaches
            vim.api.nvim_create_autocmd('LspAttach', {
                callback = function(args)
                    local bufnr = args.buf
                    local opts = { buffer = bufnr, silent = true }

                    vim.keymap.set('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>', opts)
                    vim.keymap.set('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>', opts)
                    vim.keymap.set('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>', opts)
                    vim.keymap.set('n', 'gi', ':Telescope lsp_implementations<cr>', opts)
                    vim.keymap.set('n', 'go', '<cmd>lua vim.lsp.buf.type_definition()<cr>', opts)
                    vim.keymap.set('n', 'gr', '<cmd>Telescope lsp_references<cr>', opts)
                    vim.keymap.set('n', 'gs', '<cmd>lua vim.lsp.buf.signature_help()<cr>', opts)
                    vim.keymap.set('n', '<F2>', '<cmd>lua vim.lsp.buf.rename()<cr>', opts)
                    vim.keymap.set({ 'n', 'x' }, '<F3>', '<cmd>lua vim.lsp.buf.format({async = true})<cr>', opts)
                    vim.keymap.set('n', '<F4>', '<cmd>lua vim.lsp.buf.code_action()<cr>', opts)
                    vim.keymap.set('n', 'gl', '<cmd>lua vim.diagnostic.open_float()<cr>', opts)
                    vim.keymap.set('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<cr>', opts)
                    vim.keymap.set('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<cr>', opts)
                end,
            })

            -- Format on save
            vim.api.nvim_create_autocmd('BufWritePre', {
                callback = function(args)
                    local ft = vim.bo[args.buf].filetype
                    local format_fts = {
                        rust = true,
                        lua = true,
                        javascript = true,
                        javascriptreact = true,
                        typescript = true,
                        typescriptreact = true,
                        vue = true,
                        svelte = true,
                        go = true,
                        templ = true,
                        html = true,
                        sql = true,
                        astro = true,
                        hcl = true,
                        terraform = true,
                        markdown = true,
                        cue = true,
                        nix = true,
                        nu = true,
                        zig = true,
                        zir = true,
                        toml = true,
                        css = true,
                    }

                    if format_fts[ft] then
                        vim.lsp.buf.format({ async = false, timeout_ms = 10000 })
                    end
                end,
            })
        end
    }
}
