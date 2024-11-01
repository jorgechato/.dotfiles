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
