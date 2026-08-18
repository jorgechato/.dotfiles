local ensure_installed = {
    "rust",
    "sql",
    "nix",
    "zig",
    "cue",
    "terraform",
    "hcl",
    "lua",
    "astro",
    "svelte",
    "css",
    "scss",
    "html",
    "vue",
    "javascript",
    "json",
    "typescript",
    "tsx",
    "templ",
    "markdown",
    "markdown_inline",
    "nu",
    "toml",
}

return {
    {
        "nvim-treesitter/nvim-treesitter",
        branch = "main",
        build = ":TSUpdate",
        lazy = false,
        init = function()
            vim.filetype.add({
                extension = {
                    mdx = "markdown",
                    tfvars = "terraform",
                    templ = "templ",
                },
            })
            vim.treesitter.language.register("markdown", "mdx")
        end,
        config = function()
            require("nvim-treesitter").install(ensure_installed)

            vim.api.nvim_create_autocmd("FileType", {
                group = vim.api.nvim_create_augroup("treesitter-start", { clear = true }),
                callback = function(args)
                    local buf = args.buf
                    local ft = args.match
                    local lang = vim.treesitter.language.get_lang(ft) or ft
                    if vim.treesitter.language.add(lang) then
                        vim.treesitter.start(buf, lang)
                        -- keep vim regex highlighting on top for these filetypes
                        if ft == "markdown" or ft == "templ" then
                            vim.bo[buf].syntax = "on"
                        end
                        -- treesitter-based indentation
                        vim.bo[buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
                    end
                end,
            })
        end,
    },
}
