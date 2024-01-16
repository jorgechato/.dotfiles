return {
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        event = { "BufReadPre", "BufNewFile" },
        config = function()
            local configs = require("nvim-treesitter.configs")

            configs.setup({
                highlight = { enable = true },
                indent = { enable = true },
                auto_install = false,
                autotag = { enable = true },
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
                },
            })
        end
    },
}
