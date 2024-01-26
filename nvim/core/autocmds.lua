local api = vim.api

-- show cursor line only in active window
local cursorGrp = api.nvim_create_augroup("CursorLine", { clear = true })
api.nvim_create_autocmd({ "InsertLeave", "WinEnter" }, {
    pattern = "*",
    command = "set cursorline",
    group = cursorGrp,
})
api.nvim_create_autocmd(
    { "InsertEnter", "WinLeave" },
    { pattern = "*", command = "set nocursorline", group = cursorGrp }
)

-- Enable spell checking for certain file types
api.nvim_create_autocmd(
    { "BufRead", "BufNewFile" },
    {
        pattern = { "*.txt", "*.md", "*.tex" },
        callback = function()
            vim.opt.spell = true
            vim.opt.spelllang = "en"
        end,
    }
)

-- If the file is long... don't sync syntax highlight, the maximum is 200 lines
api.nvim_create_autocmd("BufEnter", { command = [[syntax sync minlines=200]] })

-- JS and TS augroup vimrc-javascript autocmd!
-- autocmd FileType javascript setl shiftwidth=2 tabstop=4|setl shiftwidth=4|setl expandtab softtabstop=4
local jsGrp = api.nvim_create_augroup("vimrc-javascript", { clear = true })
api.nvim_create_autocmd(
    { "FileType" },
    {
        pattern = "javascript",
        callback = function()
            vim.opt.tabstop = 4
            vim.opt.shiftwidth = 4
            vim.opt.expandtab = true
            vim.opt.softtabstop = 4
        end,
        group = jsGrp,
    }
)
