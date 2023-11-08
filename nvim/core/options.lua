--------------------------------------------------------------
-- Basic Options
--------------------------------------------------------------
local options = {
    fileencoding = "utf-8",                  -- the encoding written to a file
    showcmd = true,                          -- Don't show the command in the last line
    mouse = "a",                             -- allow the mouse to be used in neovim
    smartindent = true,                      -- make indenting smarter again
    smartcase = true,                        -- smart case
    smarttab = true,
    title = true,                            -- set the title of window to the value of the titlestring
    ruler = true,
    number = true,                           -- set numbered lines
    wrap = false,                            -- display lines as one long line
    termguicolors = true,                    -- set term gui colors (most terminals support this)
    scrolloff = 5,                           -- Makes sure there are always n lines of context
    sidescrolloff = 10,                      -- Makes sure there are always n lines of context
    confirm = true,                          -- confirm to save changes before exiting modified buffer
    incsearch = true,                        -- make search act like search in modern browsers
    backup = false,                          -- creates a backup file
    clipboard = "unnamedplus",               -- allows neovim to access the system clipboard
    cmdheight = 1,                           -- more space in the neovim command line for displaying messages
    completeopt = { "menuone", "noselect" }, -- mostly just for cmp
    conceallevel = 0,                        -- so that `` is visible in markdown files
    hlsearch = true,                         -- highlight all matches on previous search pattern
    ignorecase = true,                       -- ignore case in search patterns
    pumheight = 10,                          -- pop up menu height
    showmode = false,                        -- we don't need to see things like -- INSERT -- anymore
    showtabline = 0,                         -- always show tabs
    splitbelow = true,                       -- force all horizontal splits to go below current window
    splitright = true,                       -- force all vertical splits to go to the right of current window
    swapfile = false,                        -- creates a swapfile
    timeoutlen = 1000,                       -- time to wait for a mapped sequence to complete (in milliseconds)
    undofile = true,                         -- enable persistent undo
    updatetime = 100,                        -- faster completion (4000ms default)
    expandtab = true,                        -- convert tabs to spaces
    cursorline = true,                       -- highlight the current line
    breakindent = true,                      -- wrap lines with indent
    cursorlineopt = "number",                -- set the cursorline
    textwidth = 120,
    colorcolumn = '+1',                      -- Display margin at 120
}

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
for k, v in pairs(options) do
    vim.opt[k] = v
end
