return {
    {
        "nvim-treesitter/nvim-treesitter",
        dependencies = {
            "MDeiml/tree-sitter-markdown",
        },
        build = ":TSUpdate",
        event = { "BufReadPre", "BufNewFile" },
        init = function()
            vim.filetype.add({
                extension = {
                    mdx = "markdown",
                    tfvars = 'terraform',
                },
            })
            vim.treesitter.language.register("markdown", "mdx")
        end,
        config = function()
            local configs = require("nvim-treesitter.configs")

            configs.setup({
                highlight = {
                    enable = true,
                    additional_vim_regex_highlighting = { 'markdown' },
                },
                indent = { enable = true },
                auto_install = false,
                ensure_installed = {
                    "astro",
                    "css",
                    "scss",
                    "html",
                    "vue",
                    "javascript",
                    "json",
                    "typescript",
                    "tsx",
                    "markdown",
                    "markdown_inline",
                },
            })
        end
    },
}
