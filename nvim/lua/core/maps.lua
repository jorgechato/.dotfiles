local opts = { noremap = true }
local silent_opts = { noremap = true, silent = true }
local map = vim.keymap.set

--------------------------------------------------------------
-- Mapping
--------------------------------------------------------------
-- Escape terminal mode with <ESC>
map('t', '<Esc>', '<C-\\><C-n>', opts)

-- Save
map('n', '<C-s>', '<Esc>:w<CR>', opts)
map('i', '<C-s>', '<Esc>:w<CR>a', opts)

-- Best pasting ever (keeps the copied text)
map("x", "<leader>p", [["_dP]])

-- fzf
map('i', '<C-x><C-k>', '<Plug>(fzf-complete-word)', { silent = true })
map('i', '<C-x><C-f>', '<Plug>(fzf-complete-path)', { silent = true })
map('i', '<C-x><C-l>', '<Plug>(fzf-complete-line)', { silent = true })

map('c', '<C-P>', '<C-R>=expand("%:p:h") . "/" <CR>', opts)

if vim.fn.has('macunix') == 1 then
    -- pbcopy for OSX copy/paste
    map('v', '<C-x>', ':!pbcopy<CR>', opts)
    map('v', '<C-c>', ':w !pbcopy<CR><CR>', opts)
end

-- Switching windows
map('n', '<C-j>', '<C-w>j', opts)
map('n', '<C-k>', '<C-w>k', opts)
map('n', '<C-l>', '<C-w>l', opts)
map('n', '<C-h>', '<C-w>h', opts)
