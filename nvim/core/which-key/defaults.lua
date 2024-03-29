return {
    mode = { "n", "v" },
    ["<space>"] = { ":noh<cr>", "Clean search (highlight)" },
    ["."] = { ":lcd %:p:h<CR>", "Set working directory" },
    e = { ':e <C-R>=expand("%:p:h") . "/" <CR>', "Open an edit command" },
    p = { '"+gP<CR>', "Paste from clipboard" },
    te = { ':tabe <C-R>=expand("%:p:h") . "/" <CR>', "Open a tab edit command" },
    c = { ":bd<CR>", "Close Buffer" },
    w = { ":w!<CR>", "Save" },
    q = { ":confirm q<CR>", "Quit" },
    f = { "<cmd>lua require('core.utils').telescope_git_or_file()<CR>", "Find Files (Root)" },
    r = {
        name = "Replace",
        r = { "<cmd>lua require('spectre').open()<cr>", "Replace" },
        w = { "<cmd>lua require('spectre').open_visual({select_word=true})<cr>", "Replace Word" },
        f = { "<cmd>lua require('spectre').open_file_search()<cr>", "Replace Buffer" },
        l = { "gd[{V%::s/<C-R>///gc<left><left><left>", "Replace Line" },
        a = { "gD:%s/<C-R>///gc<left><left><left>", "Replace All" },
    },
    b = {
        name = "Buffers",
        o = { ":Telescope buffers<CR>", "Open Buffer" },
        f = { "<cmd>Telescope buffers previewer=false<cr>", "Find" },
        W = { "<cmd>noautocmd w<cr>", "Save without formatting (noautocmd)" },
    },
    g = {
        name = "Git",
        -- fugitive git bindings
        -- map('n', '<Leader>ge', ':Gedit<Space>', opts)
        -- map('n', '<Leader>gp', ':Git push origin <Space>', opts)
        -- map('n', '<Leader>g-', ':Silent Git stash<CR>:e<CR>', opts)
        -- map('n', '<Leader>g+', ':Silent Git stash pop<CR>:e<CR>', opts)
        -- map('n', '<Leader>gsb', ':Git switch<Space>', opts)
        -- map('n', '<Leader>go', ':.GBrowse<CR>', opts) -- Open current file on github
        k = { "<cmd>lua require 'gitsigns'.prev_hunk({navigation_message = false})<cr>", "Prev Hunk" },
        l = { "<cmd>lua require 'gitsigns'.blame_line()<cr>", "Blame" },
        p = { "<cmd>lua require 'gitsigns'.preview_hunk()<cr>", "Preview Hunk" },
        r = { "<cmd>lua require 'gitsigns'.reset_hunk()<cr>", "Reset Hunk" },
        R = { "<cmd>lua require 'gitsigns'.reset_buffer()<cr>", "Reset Buffer" },
        j = { "<cmd>lua require 'gitsigns'.next_hunk({navigation_message = false})<cr>", "Next Hunk" },
        -- s = { "<cmd>lua require 'gitsigns'.stage_hunk()<cr>", "Stage Hunk" },
        u = {
            "<cmd>lua require 'gitsigns'.undo_stage_hunk()<cr>",
            "Undo Stage Hunk",
        },
        o = { "<cmd>Telescope git_status<cr>", "Open changed file" },
        b = { "<cmd>Telescope git_branches<cr>", "Checkout branch" },
        c = { "<cmd>Telescope git_commits<cr>", "Checkout commit" },
        C = {
            "<cmd>Telescope git_bcommits<cr>",
            "Checkout commit(for current file)",
        },
        d = {
            "<cmd>Gitsigns diffthis HEAD<cr>",
            "Git Diff",
        },
        s = {
            name = "Search",
            t = { ":Git<cr>", "Git interactive (ST)" },
            c = { "<cmd>Telescope git_commits<cr>", "Git commits" },
            B = { "<cmd>Telescope git_branches<cr>", "Git branches" },
            s = { "<cmd>Telescope git_status<cr>", "Git status" },
            S = { "<cmd>Telescope git_stash<cr>", "Git stash" },
        },
    },
    j = {
        name = "Jump",
        u = { "<cmd>Telescope lsp_references<cr>", "References" },
        d = { "<cmd>lua vim.lsp.buf.definition()<cr>", "Definition" },
        D = { "<cmd>lua vim.lsp.buf.declaration()<cr>", "Declaration" },
        i = { "<cmd>lua vim.lsp.buf.implementation()<cr>", "Implementation" },
        t = { "<cmd>lua vim.lsp.buf.type_definition()<cr>", "Type Definition" },
        a = { "<cmd>lua vim.lsp.buf.code_action()<cr>", "Code Action" },
        A = { "<cmd>lua vim.lsp.buf.range_code_action()<cr>", "Range Code Actions" },
        s = { "<cmd>lua vim.lsp.buf.signature_help()<cr>", "Display Signature Information" },
        R = { "<cmd>lua vim.lsp.buf.rename()<cr>", "Rename all references" },
        f = { "<cmd>lua vim.lsp.buf.format()<cr>", "Format" },
        K = { "<cmd>lua vim.lsp.buf.hover()<cr>", "Hover" },
        l = { "<cmd>TroubleToggle document_diagnostics<cr>", "Document Diagnostics (Trouble)" },
        L = { "<cmd>TroubleToggle workspace_diagnostics<cr>", "Workspace Diagnostics (Trouble)" },
        w = { "<cmd>Telescope diagnostics<cr>", "Diagnostics" },
        h = { "<cmd>lua require('core.utils').toggle_inlay_hints()<CR>", "Toggle Inlay Hints" },
    },
    s = {
        name = "Search",
        f = { "<cmd>Telescope find_files<cr>", "Find File (CWD)" },
        h = { "<cmd>Telescope help_tags<cr>", "Find Help" },
        H = { "<cmd>Telescope highlights<cr>", "Find highlight groups" },
        M = { "<cmd>Telescope man_pages<cr>", "Man Pages" },
        o = { "<cmd>Telescope oldfiles<cr>", "Open Recent File" },
        R = { "<cmd>Telescope registers<cr>", "Registers" },
        s = { "<cmd>Telescope live_grep<cr>", "Live Grep" },
        S = { "<cmd>Telescope grep_string<cr>", "Grep String" },
        k = { "<cmd>Telescope keymaps<cr>", "Keymaps" },
        C = { "<cmd>Telescope commands<cr>", "Commands" },
        l = { "<cmd>Telescope resume<cr>", "Resume last search" },
        e = { "<cmd>Telescope frecency<cr>", "Frecency" },
        b = { "<cmd>Telescope buffers<cr>", "Buffers" },
    },
    t = {
        name = "Todo",
        t = { "<cmd>TodoTelescope previewer=false layout_config={vertical={height=0.4}}<cr>", "Todo" },
        T = { "<cmd>TodoTelescope previewer=false layout_config={vertical={height=0.4}} keywords=TODO,FIX,FIXME<cr>", "Todo/Fix/Fixme" },
        x = { "<cmd>TodoTrouble<cr>", "Todo (Trouble)" },
        X = { "<cmd>TodoTrouble keywords=TODO,FIX,FIXME<cr><cr>", "Todo/Fix/Fixme (Trouble)" },
    },
    m = {
        name = "Markdown",
        p = { "<cmd>MarkdownPreviewToggle<cr>", "Preview" },
        P = { "<cmd>MarkdownPreview<cr>", "Preview (Split)" },
        s = { "<cmd>MarkdownPreviewStop<cr>", "Preview Stop" },
    },
}
