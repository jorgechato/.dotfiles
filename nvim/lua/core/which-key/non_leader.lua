return {
    mode = { "n", "v" }, -- NORMAL and VISUAL mode
    { "YY", '"+y<CR>',                                                      desc = "Yank to clipboard" },
    { "XX", '"+x<CR>',                                                      desc = "Clipboard to yank" },
    { ">",  ">gv",                                                          desc = "Shift right",          mode = "v" },
    { "<",  "<gv",                                                          desc = "Shift left",           mode = "v" },
    { "K",  ":m '<-2<CR>gv=gv",                                             desc = "Move visual block up", mode = "v" },
    { "J",  ":m '>+1<CR>gv=gv",                                             desc = "Move visual block down", mode = "v" },
    { "n",  "nzzzv",                                                        desc = "Next search" },
    { "N",  "Nzzzv",                                                        desc = "Previous search" },
    { "tn", ":tabnew<CR>",                                                  desc = "New tab" },
    { "~",  'y:call setreg("", TwiddleCase(@"), getregtype(""))<CR>gv"Pgv', desc = "TwiddleCase",          mode = "v" },
}
