local opts = { noremap = true }
local silent_opts = { noremap = true, silent = true }
local map = vim.keymap.set

--------------------------------------------------------------
-- Mappping
--------------------------------------------------------------
-- Search mappings: These will make it so that going to the next one in a
-- search will center on the line it's found in.
map('n', 'n', 'nzzzv', opts)
map('n', 'N', 'Nzzzv', opts)

-- Comment on <cntr>/
--map('n', '<C-_>', '<cmd>lua require("nerdcommenter").toggle()<CR>', opts)
--map('v', '<C-_>', '<cmd>lua require("nerdcommenter").toggle()<CR>gv', opts)
--map('i', '<C-_>', '<Esc><cmd>lua require("nerdcommenter").toggle()<CR>a', opts)

-- Escape terminal mode with <ESC>
map('t', '<Esc>', '<C-\\><C-n>', opts)

-- Ack
-- vim.cmd('cnoreabbrev Ack Ack!')
-- map('n', '<leader>a', ':Ack!<Space>', opts)

-- Save
map('n', '<C-s>', '<Esc>:w<CR>', opts)
map('i', '<C-s>', '<Esc>:w<CR>a', opts)

-- fzf
map('i', '<C-x><C-k>', '<Plug>(fzf-complete-word)', { silent = true })
map('i', '<C-x><C-f>', '<Plug>(fzf-complete-path)', { silent = true })
map('i', '<C-x><C-l>', '<Plug>(fzf-complete-line)', { silent = true })

-- TwiddleCase
map('v', '~', 'y:call setreg("", TwiddleCase(@"), getregtype(""))<CR>gv"Pgv', opts)

-- Tabs
map('n', 'tn', ':tabnew<CR>', silent_opts)

map('c', '<C-P>', '<C-R>=expand("%:p:h") . "/" <CR>', opts)

map('n', 'YY', '"+y<CR>', opts)
map('n', 'XX', '"+x<CR>', opts)

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

-- Vmap for maintain Visual Mode after shifting > and <
map('v', '<', '<gv', opts)
map('v', '>', '>gv', opts)

-- Move visual block
map('v', 'J', ':m \'>+1<CR>gv=gv', opts)
map('v', 'K', ':m \'<-2<CR>gv=gv', opts)
