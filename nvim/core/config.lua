--------------------------------------------------------------
-- Pre Config
--------------------------------------------------------------
if vim.fn.has("autocmd") then
    vim.cmd("autocmd GUIEnter * set visualbell t_vb=")
end

-- Copy/Paste/Cut
if vim.fn.has("unnamedplus") then
    vim.opt.clipboard = "unnamed,unnamedplus"
end

-- fzf.vim
vim.opt.wildmode = "list:longest,list:full"
vim.opt.wildignore:append({ "*.o", "*.obj", ".git", "*.rbc", "*.pyc", "__pycache__" })
vim.env.FZF_DEFAULT_COMMAND =
"find * -path '*/\\.*' -prune -o -path 'node_modules/**' -prune -o -path 'target/**' -prune -o -path 'dist/**' -prune -o  -type f -print -o -type l -print 2> /dev/null"

-- The Silver Searcher
if vim.fn.executable("ag") then
    vim.env.FZF_DEFAULT_COMMAND = "ag --hidden --ignore .git -g \"\""
    vim.opt.grepprg = "ag --nogroup --nocolor"
end
vim.g.ackprg = "ag --vimgrep"

-- ripgrep
if vim.fn.executable("rg") then
    vim.env.FZF_DEFAULT_COMMAND = "rg --files --hidden --follow --glob \"!.git/*\""
    vim.opt.grepprg = "rg --vimgrep"
    vim.cmd(
        [[command! -bang -nargs=* Find call fzf#vim#grep('rg --column --line-number --no-heading --fixed-strings --ignore-case --hidden --follow --glob "!.git/*" --color "always" '.shellescape(<q-args>).'| tr -d "\017"', 1, <bang>0)]])
end
--------------------------------------------------------------
-- Base Config
--------------------------------------------------------------
-- ctrlp
vim.g.ctrlp_custom_ignore = {
    ['dir'] = 'out$|\\.git$|\\.data$|bower_components$|node_modules$|vendor$|target$|gen$|third_party',
    ['file'] = '\\.exe$|\\.so$|\\.dll$|\\.pyc$|\\DS_Store$',
}

--------------------------------------------------------------
-- Custom Config
--------------------------------------------------------------
-- JavaScript
vim.g.javascript_enable_domhtmlcss = 1

-- Jedi-vim
vim.g.jedi_popup_on_dot = 0
vim.g.jedi_goto_assignments_command = '<leader>g'
vim.g.jedi_goto_definitions_command = '<leader>d'
vim.g.jedi_documentation_command = 'K'
vim.g.jedi_usages_command = '<leader>n'
vim.g.jedi_rename_command = '<leader>r'
vim.g.jedi_show_call_signatures = '0'
vim.g.jedi_completions_command = '<C-Space>'
vim.g.jedi_smart_auto_mappings = 0

-- Syntax highlight
vim.g.python_highlight_all = 1
