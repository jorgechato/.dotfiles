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
-- Terminal emulation
--------------------------------------------------------------
vim.api.nvim_set_keymap('n', '<leader>sh', ':terminal<CR>', { silent = true })

--------------------------------------------------------------
-- Filetype specific mappings
--------------------------------------------------------------
vim.filetype.add({
    extension = {
        mdx = 'mdx'
    }
})
