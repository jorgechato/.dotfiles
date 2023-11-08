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
vim.cmd('cnoreabbrev Ack Ack!')
map('n', '<leader>a', ':Ack!<Space>', opts)

-- Save
map('n', '<C-s>', '<Esc>:w<CR>', opts)
map('i', '<C-s>', '<Esc>:w<CR>a', opts)

-- fzf
map('i', '<C-x><C-k>', '<Plug>(fzf-complete-word)', { silent = true })
map('i', '<C-x><C-f>', '<Plug>(fzf-complete-path)', { silent = true })
map('i', '<C-x><C-l>', '<Plug>(fzf-complete-line)', { silent = true })

-- Bookmark
map('n', '<Leader>b', '<Plug>BookmarkAnnotate', opts)
map('n', '<Leader>bl', '<Plug>BookmarkShowAll', opts)
map('n', '<Leader>j', '<Plug>BookmarkNext', opts)
map('n', '<Leader>k', '<Plug>BookmarkPrev', opts)
map('n', '<Leader>c', '<Plug>BookmarkClear', opts)
map('n', '<Leader>x', '<Plug>BookmarkClearAll', opts)
map('n', '<Leader>kk', '<Plug>BookmarkMoveUp', opts)
map('n', '<Leader>jj', '<Plug>BookmarkMoveDown', opts)
map('n', '<Leader>g', '<Plug>BookmarkMoveToLine', opts)

-- fugitive git bindings
map('n', '<Leader>g', ':Git<CR>', opts)
map('n', '<Leader>gd', ':Gdiff<Space>', opts)
map('n', '<Leader>ge', ':Gedit<Space>', opts)
map('n', '<Leader>gp', ':Git push origin <Space>', opts)
map('n', '<Leader>g-', ':Silent Git stash<CR>:e<CR>', opts)
map('n', '<Leader>g+', ':Silent Git stash pop<CR>:e<CR>', opts)
map('n', '<Leader>gsb', ':Git switch<Space>', opts)

-- Open current file on github
map('n', '<Leader>go', ':.GBrowse<CR>', opts)

-- TwiddleCase
map('v', '~', 'y:call setreg("", TwiddleCase(@"), getregtype(""))<CR>gv"Pgv', opts)

-- For local replace
map('n', 'gR', 'gd[{V%::s/<C-R>///gc<left><left><left>', opts)

-- For global replace
map('n', 'gr', 'gD:%s/<C-R>///gc<left><left><left>', opts)

-- Split
map('n', '<Leader>h', ':<C-u>split<CR>', opts)
map('n', '<Leader>v', ':<C-u>vsplit<CR>', opts)

-- Tabs
map('n', 'tn', ':tabnew<CR>', silent_opts)

-- Set working directory
map('n', '<leader>.', ':lcd %:p:h<CR>', opts)

-- Opens an edit command with the path of the currently edited file filled in
map('n', '<Leader>e', ':e <C-R>=expand("%:p:h") . "/" <CR>', opts)

-- Opens a tab edit command with the path of the currently edited file filled
map('n', '<Leader>te', ':tabe <C-R>=expand("%:p:h") . "/" <CR>', opts)

map('c', '<C-P>', '<C-R>=expand("%:p:h") . "/" <CR>', opts)
map('n', '<leader>e', ':FZF -m<CR>', silent_opts)

-- Recovery commands from history through FZF
map('n', '<leader>y', ':History:<CR>', opts)

map('n', 'YY', '"+y<CR>', opts)
map('n', '<leader>p', '"+gP<CR>', opts)
map('n', 'XX', '"+x<CR>', opts)

if vim.fn.has('macunix') == 1 then
    -- pbcopy for OSX copy/paste
    map('v', '<C-x>', ':!pbcopy<CR>', opts)
    map('v', '<C-c>', ':w !pbcopy<CR><CR>', opts)
end

-- Buffer nav
map('n', '<leader>z', ':bp<CR>', opts)
map('n', '<leader>q', ':bp<CR>', opts)
map('n', '<leader>x', ':bn<CR>', opts)
map('n', '<leader>w', ':bn<CR>', opts)

-- Close buffer
map('n', '<leader>c', ':bd<CR>', opts)

-- Clean search (highlight)
map('n', '<leader><space>', ':noh<cr>', silent_opts)

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
