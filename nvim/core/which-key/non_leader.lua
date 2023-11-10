return {
    mode = { "n", "v" },
    YY = { '"+y<CR>', "Yank to clipboard" },
    XX = { '"+x<CR>', "Clipboard to yank" },
    [">"] = { ">gv", "Shift right", mode = "v" },
    ["<"] = { "<gv", "Shift left", mode = "v" },
    K = { ":m '<-2<CR>gv=gv", "Move visual block up", mode = "v" },
    J = { ":m '>+1<CR>gv=gv", "Move visual block down", mode = "v" },
    n = { "nzzzv", "Next search" },
    N = { "Nzzzv", "Previous search" },
    tn = { ":tabnew<CR>", "New tab" },
    ["~"] = { 'y:call setreg("", TwiddleCase(@"), getregtype(""))<CR>gv"Pgv', "TwiddleCase", mode = "v" },
}
