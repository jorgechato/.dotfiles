return {
    mode = { "n", "v" },
    { "<leader><space>", ":noh<cr>",                                                                                             name = "Clean search (highlight)" },
    { "<leader>.",       ":lcd %:p:h<CR>",                                                                                       name = "Set working directory" },
    { "<leader>e",       ':e <C-R>=expand("%:p:h") . "/" <CR>',                                                                  name = "Open an edit command" },
    { "<leader>p",       '"+gP<CR>',                                                                                             name = "Paste from clipboard" },
    { "<leader>te",      ':tab <C-R>=expand("%:p:h") . "/" <CR>',                                                                name = "Open a tab edit command" },
    { "<leader>c",       ":bd<CR>",                                                                                              name = "Close Buffer" },
    { "<leader>w",       ":w!<CR>",                                                                                              name = "Save" },
    { "<leader>q",       ":confirm q<CR>",                                                                                       name = "Quit" },
    { "<leader>f",       "<cmd>lua require('core.utils').telescope_git_or_file()<CR>",                                           name = "Find Files (Root)" },
    -- Replace
    { "<leader>r",       group = "Replace" },
    { "<leader>rr",      "<cmd>lua require('spectre').open()<cr>",                                                               name = "Replace" },
    { "<leader>rw",      "<cmd>lua require('spectre').open_visual({select_word=true})<cr>",                                      name = "Replace Word" },
    { "<leader>rf",      "<cmd>lua require('spectre').open_file_search()<cr>",                                                   name = "Replace Buffer" },
    { "<leader>rl",      "gd[{V%::s/<C-R>///gc<left><left><left>",                                                               name = "Replace Line" },
    { "<leader>ra",      "gD:%s/<C-R>///gc<left><left><left>",                                                                   name = "Replace All" },
    -- Buffer
    { "<leader>b",       group = "Buffer" },
    { "<leader>bo",      ":Telescope buffers<CR>",                                                                               name = "Open Buffer" },
    { "<leader>bf",      "<cmd>Telescope buffers previewer=false<cr>",                                                           name = "Find" },
    { "<leader>bW",      "<cmd>noautocmd w<cr>",                                                                                 name = "Save without formatting (noautocmd)" },
    -- Git
    { "<leader>g",       group = "Git" },
    { "<leader>gk",      "<cmd>lua require 'gitsigns'.prev_hunk({navigation_message = false})<cr>",                              name = "Prev Hunk" },
    { "<leader>gl",      "<cmd>lua require 'gitsigns'.blame_line()<cr>",                                                         name = "Blame" },
    { "<leader>gp",      "<cmd>lua require 'gitsigns'.preview_hunk()<cr>",                                                       name = "Preview Hunk" },
    { "<leader>gr",      "<cmd>lua require 'gitsigns'.reset_hunk()<cr>",                                                         name = "Reset Hunk" },
    { "<leader>gR",      "<cmd>lua require 'gitsigns'.reset_buffer()<cr>",                                                       name = "Reset Buffer" },
    { "<leader>gj",      "<cmd>lua require 'gitsigns'.next_hunk({navigation_message = false})<cr>",                              name = "Next Hunk" },
    { "<leader>gu",      "<cmd>lua require 'gitsigns'.undo_stage_hunk()<cr>",                                                    name = "Undo Stage Hunk" },
    { "<leader>go",      "<cmd>Telescope git_status<cr>",                                                                        name = "Open changed file" },
    { "<leader>gb",      "<cmd>Telescope git_branches<cr>",                                                                      name = "Checkout branch" },
    { "<leader>gc",      "<cmd>Telescope git_commits<cr>",                                                                       name = "Checkout commit" },
    { "<leader>gC",      "<cmd>Telescope git_bcommits<cr>",                                                                      name = "Checkout commit(for current file)" },
    { "<leader>gd",      "<cmd>Gitsigns diffthis HEAD<cr>",                                                                      name = "Git Diff" },
    { "<leader>gst",     ":Git<cr>",                                                                                             name = "Git interactive (ST)" },
    { "<leader>gsc",     "<cmd>Telescope git_commits<cr>",                                                                       name = "Git commits" },
    { "<leader>gsB",     "<cmd>Telescope git_branches<cr>",                                                                      name = "Git branches" },
    { "<leader>gss",     "<cmd>Telescope git_status<cr>",                                                                        name = "Git status" },
    { "<leader>gsS",     "<cmd>Telescope git_stash<cr>",                                                                         name = "Git stash" },
    -- Jump
    { "<leader>j",       group = "Jump" },
    { "<leader>ju",      "<cmd>Telescope lsp_references<cr>",                                                                    name = "References" },
    { "<leader>jd",      "<cmd>lua vim.lsp.buf.definition()<cr>",                                                                name = "Definition" },
    { "<leader>jD",      "<cmd>lua vim.lsp.buf.declaration()<cr>",                                                               name = "Declaration" },
    { "<leader>ji",      "<cmd>lua vim.lsp.buf.implementation()<cr>",                                                            name = "Implementation" },
    { "<leader>jt",      "<cmd>lua vim.lsp.buf.type_definition()<cr>",                                                           name = "Type Definition" },
    { "<leader>ja",      "<cmd>lua vim.lsp.buf.code_action()<cr>",                                                               name = "Code Action" },
    { "<leader>js",      "<cmd>lua vim.lsp.buf.signature_help()<cr>",                                                            name = "Display Signature Information" },
    -- Search
    { "<leader>s",       group = "Search" },
    { "<leader>sf",      "<cmd>Telescope find_files<cr>",                                                                        name = "Find File (CWD)" },
    { "<leader>sh",      "<cmd>Telescope help_tags<cr>",                                                                         name = "Find Help" },
    { "<leader>sH",      "<cmd>Telescope highlights<cr>",                                                                        name = "Find highlight groups" },
    { "<leader>sM",      "<cmd>Telescope man_pages<cr>",                                                                         name = "Man Pages" },
    { "<leader>so",      "<cmd>Telescope oldfiles<cr>",                                                                          name = "Open Recent File" },
    { "<leader>sR",      "<cmd>Telescope registers<cr>",                                                                         name = "Registers" },
    { "<leader>ss",      "<cmd>Telescope live_grep<cr>",                                                                         name = "Live Grep" },
    { "<leader>sS",      "<cmd>Telescope grep_string<cr>",                                                                       name = "Grep String" },
    { "<leader>sk",      "<cmd>Telescope keymaps<cr>",                                                                           name = "Keymaps" },
    { "<leader>sC",      "<cmd>Telescope commands<cr>",                                                                          name = "Commands" },
    { "<leader>sl",      "<cmd>Telescope resume<cr>",                                                                            name = "Resume last search" },
    { "<leader>se",      "<cmd>Telescope frecency<cr>",                                                                          name = "Frecency" },
    { "<leader>sb",      "<cmd>Telescope buffers<cr>",                                                                           name = "Buffers" },
    -- Todo
    { "<leader>t",       group = "Todo" },
    { "<leader>tt",      "<cmd>TodoTelescope previewer=false layout_config={vertical={height=0.4}}<cr>",                         name = "Todo" },
    { "<leader>tT",      "<cmd>TodoTelescope previewer=false layout_config={vertical={height=0.4}} keywords=TODO,FIX,FIXME<cr>", name = "Todo/Fix/Fixme" },
    { "<leader>tx",      "<cmd>TodoTrouble<cr>",                                                                                 name = "Todo (Trouble)" },
    { "<leader>tX",      "<cmd>TodoTrouble keywords=TODO,FIX,FIXME<cr><cr>",                                                     name = "Todo/Fix/Fixme (Trouble)" },
    -- Markdown
    { "<leader>m",       group = "Markdown" },
    { "<leader>mm",      "<cmd>MarkdownPreviewToggle<cr>",                                                                       name = "Preview" },
    { "<leader>mP",      "<cmd>MarkdownPreview<cr>",                                                                             name = "Preview (Split)" },
    { "<leader>ms",      "<cmd>MarkdownPreviewStop<cr>",                                                                         name = "Preview Stop" },
}
