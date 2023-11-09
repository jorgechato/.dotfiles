return {
    mode = { "n", "v" },
    w = { ":w!<CR>", "Save" },
    q = { ":confirm q<CR>", "Quit" },
    c = { ":bd<CR>", "Close Buffer" },
    f = { "<cmd>lua require('core.utils').telescope_git_or_file()<CR>", "Find Files (Root)" },
    v = "Go to definition in a split",
    -- m = {
    --   name = "Marks",
    --   m = { "<cmd>Telescope marks<cr>", "Marks" },
    -- },
    r = {
        name = "Replace",
        r = { "<cmd>lua require('spectre').open()<cr>", "Replace" },
        w = { "<cmd>lua require('spectre').open_visual({select_word=true})<cr>", "Replace Word" },
        f = { "<cmd>lua require('spectre').open_file_search()<cr>", "Replace Buffer" },
    },
    b = {
        name = "Buffers",
        o = { ":Telescope buffers<CR>", "Open Buffer" },
        f = { "<cmd>Telescope buffers previewer=false<cr>", "Find" },
        W = { "<cmd>noautocmd w<cr>", "Save without formatting (noautocmd)" },
    },
    G = {
        name = "+Git",
        k = { "<cmd>lua require 'gitsigns'.prev_hunk({navigation_message = false})<cr>", "Prev Hunk" },
        l = { "<cmd>lua require 'gitsigns'.blame_line()<cr>", "Blame" },
        p = { "<cmd>lua require 'gitsigns'.preview_hunk()<cr>", "Preview Hunk" },
        r = { "<cmd>lua require 'gitsigns'.reset_hunk()<cr>", "Reset Hunk" },
        R = { "<cmd>lua require 'gitsigns'.reset_buffer()<cr>", "Reset Buffer" },
        j = { "<cmd>lua require 'gitsigns'.next_hunk({navigation_message = false})<cr>", "Next Hunk" },
        s = { "<cmd>lua require 'gitsigns'.stage_hunk()<cr>", "Stage Hunk" },
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
    },
    l = {
        name = "+LSP",
        a = { "<cmd>lua vim.lsp.buf.code_action()<cr>", "Code Action" },
        A = { "<cmd>lua vim.lsp.buf.range_code_action()<cr>", "Range Code Actions" },
        d = { "<cmd>lua vim.lsp.buf.definition()<cr>", "Definition" },
        D = { "<cmd>lua vim.lsp.buf.declaration()<cr>", "Declaration" },
        i = { "<cmd>lua vim.lsp.buf.implementation()<cr>", "Implementation" },
        o = { "<cmd>lua vim.lsp.buf.type_definition()<cr>", "Type Definition" },
        R = { "<cmd>Telescope lsp_references<cr>", "References" },
        s = { "<cmd>lua vim.lsp.buf.signature_help()<cr>", "Display Signature Information" },
        r = { "<cmd>lua vim.lsp.buf.rename()<cr>", "Rename all references" },
        f = { "<cmd>lua vim.lsp.buf.format()<cr>", "Format" },
        K = { "<cmd>lua vim.lsp.buf.hover()<cr>", "Hover" },
        l = { "<cmd>TroubleToggle document_diagnostics<cr>", "Document Diagnostics (Trouble)" },
        L = { "<cmd>TroubleToggle workspace_diagnostics<cr>", "Workspace Diagnostics (Trouble)" },
        w = { "<cmd>Telescope diagnostics<cr>", "Diagnostics" },
        h = { "<cmd>lua require('core.utils').toggle_inlay_hints()<CR>", "Toggle Inlay Hints" },
    },
    s = {
        name = "+Search",
        f = { "<cmd>Telescope find_files<cr>", "Find File (CWD)" },
        h = { "<cmd>Telescope help_tags<cr>", "Find Help" },
        H = { "<cmd>Telescope highlights<cr>", "Find highlight groups" },
        M = { "<cmd>Telescope man_pages<cr>", "Man Pages" },
        o = { "<cmd>Telescope oldfiles<cr>", "Open Recent File" },
        R = { "<cmd>Telescope registers<cr>", "Registers" },
        t = { "<cmd>Telescope live_grep<cr>", "Live Grep" },
        T = { "<cmd>Telescope grep_string<cr>", "Grep String" },
        k = { "<cmd>Telescope keymaps<cr>", "Keymaps" },
        C = { "<cmd>Telescope commands<cr>", "Commands" },
        l = { "<cmd>Telescope resume<cr>", "Resume last search" },
        c = { "<cmd>Telescope git_commits<cr>", "Git commits" },
        B = { "<cmd>Telescope git_branches<cr>", "Git branches" },
        s = { "<cmd>Telescope git_status<cr>", "Git status" },
        S = { "<cmd>Telescope git_stash<cr>", "Git stash" },
        z = { "<cmd>Telescope zoxide list<cr>", "Zoxide" },
        e = { "<cmd>Telescope frecency<cr>", "Frecency" },
        b = { "<cmd>Telescope buffers<cr>", "Buffers" },
    },
    t = {
        name = "+Todo",
        t = { "<cmd>TodoTelescope<cr>", "Todo" },
        T = { "<cmd>TodoTelescope keywords=TODO,FIX,FIXME<cr>", "Todo/Fix/Fixme" },
        x = { "<cmd>TodoTrouble<cr>", "Todo (Trouble)" },
        X = { "<cmd>TodoTrouble keywords=TODO,FIX,FIXME<cr><cr>", "Todo/Fix/Fixme (Trouble)" },
    },
}
