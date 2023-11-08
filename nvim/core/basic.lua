--------------------------------------------------------------
-- Abbreviations
--------------------------------------------------------------
vim.cmd([[
    cnoreabbrev W! w!
    cnoreabbrev Q! q!
    cnoreabbrev Qall! qall!
    cnoreabbrev Wq wq
    cnoreabbrev Wa wa
    cnoreabbrev wQ wq
    cnoreabbrev WQ wq
    cnoreabbrev W w
    cnoreabbrev Q q
    cnoreabbrev Qall qall
]])

--------------------------------------------------------------
-- Grep.vim
--------------------------------------------------------------
vim.api.nvim_set_keymap('n', '<leader>f', ':Rgrep<CR>', { silent = true })
vim.g.Grep_Default_Options = '-IR'
vim.g.Grep_Skip_Files = '*.log *.db'
vim.g.Grep_Skip_Dirs = '.git node_modules'

--------------------------------------------------------------
-- Terminal emulation
--------------------------------------------------------------
vim.api.nvim_set_keymap('n', '<leader>sh', ':terminal<CR>', { silent = true })

--------------------------------------------------------------
-- Commands
--------------------------------------------------------------
vim.cmd('command! FixWhitespace :%s/\\s\\+$//e')
