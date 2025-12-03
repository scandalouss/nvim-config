local M = {}
local theme = "gentoo"
local pal = require("dk3.opts.theme2.colors."..theme)

function M.setup()
    local set = vim.api.nvim_set_hl -- so i dont have to type so much
    vim.cmd("hi clear")

    -- editor highlights
    set(0, "Normal", {fg = pal.fg1, bg = pal.bg1})
    set(0, "Terminal", {fg = pal.fg1 , bg = pal.bg1 ,})
    set(0, "EndOfBuffer", {fg = , bg = ,}) -- filler lines (~) after the end of the buffer. By default, uses |hl-NonText|
    set(0, "FoldColumn", {fg = , bg = ,}) -- column where folds are displayed
    set(0, "Folded", {fg = , bg = ,}) -- line used for closed folds
    set(0, "SignColumn", {fg = , bg = ,}) -- column where |signs| are displayed
    set(0, "SignColumnSB", {fg = , bg = ,}) -- same as |hl-SignColumn|
    set(0, "ToolbarLine", {fg = , bg = ,})
    set(0, "Cursor", {fg = , bg = ,}) -- Character under the Cursor
    set(0, "lCursor", {fg = , bg = ,}) -- character under the cursor when |language-mapping| is used ("guicursor")
    set(0, "CursorIM", {fg = , bg = ,}) -- character under the cursor when in IME mode
    set(0, "CurSearch", {fg = , bg = ,}) -- current match for the last search pattern ("hlsearch")
    set(0, "CursorColumn", {fg = , bg = ,}) -- used for columns set with "colorcolumn"
    set(0, "CursorLineNr", {fg = , bg = ,}) -- like LineNr when "cursorline" or "relativenumber" is set for the cursor line
    set(0, "LineNr", {fg = , bg = ,}) -- line number for ":number" and ":#" commands, and when "number" or "relativenumber" is set
    set(0, "Conceal", {fg = , bg = ,}) -- placeholder characters substituted for concealed text ("conceallevel")
    set(0, "Directory", {fg = , bg = ,}) -- directory names (and other special names in listings)
    set(0, "ErrorMsg", {fg = , bg = ,}) -- error messages on the command line
    set(0, "WarningMsg", {fg = , bg = ,})
    set(0, "MoreMsg", {fg = , bg = ,})
    set(0, "IncSearch", {fg = , bg = ,})
    set(0, "Search", {fg = , bg = ,})
    set(0, "Substitute", {fg = , bg = ,}) -- |:substitute| replacement text highlighting
    set(0, "ModeMsg", {fg = , bg = ,}) -- 'showmode' message (e.g., "--INSERT--")
    set(0, "MatchParen", {fg = , bg = ,}) -- the Character under the cursor or just before it, if it is a paired bracket, and its match
    set(0, "NonText", {fg = , bg = ,})
    set(0, "Whitespace", {fg = , bg = ,})
    set(0, "SpecialKey", {fg = , bg = ,})
    set(0, "Pmenu", {fg = , bg = ,})
    set(0, "PmenuSbar", {fg = , bg = ,})
    set(0, "PmenuSel", {fg = , bg = ,})
    set(0, "WildMenu", {fg = , bg = ,})
    set(0, "PmenuThumb", {fg = , bg = ,})
    set(0, "Question", {fg = , bg = ,})
    set(0, "SpellBad", {fg = , bg = ,})
    set(0, "SpellCap", {fg = , bg = ,})
    set(0, "SpellLocal", {fg = , bg = ,})
    set(0, "SpellRare", {fg = , bg = ,})
    set(0, "StatusLine", {fg = , bg = ,})
    set(0, "StatusLineTerm", {fg = , bg = ,})
    set(0, "StatusLineNC", {fg = , bg = ,})
    set(0, "StatusLineTermNC", {fg = , bg = ,})
    set(0, "TabLine", {fg = , bg = ,})
    set(0, "TabLineFill", {fg = , bg = ,})
    set(0, "TabLineSel", {fg = , bg = ,})
    set(0, "WinSeperator", {fg = , bg = ,}) -- the column separating vertically split windows
    set(0, "VertSplit", {fg = , bg = ,}) -- same as |hl-WinSeperator|
    set(0, "Visual", {fg = , bg = ,})
    set(0, "VisualNOS", {fg = , bg = ,})
    set(0, "QuickFixLine", {fg = , bg = ,})
    set(0, "Debug", {fg = , bg = ,})
    set(0, "debucPC", {fg = , bg = ,})
    set(0, "debugBreakpoint", {fg = , bg = ,})
    set(0, "ToolbarButton", {fg = , bg = ,})
    set(0, "FloatBorder", {fg = , bg = ,})
    set(0, "NormalFloat", {fg = , bg = ,})
    set(0, "WinBar", {fg = , bg = ,})
    set(0, "WinBarNC", {fg = , bg = ,})


    set(0, "DiffAdd", {fg = , bg = ,}) -- diff mode: Added line
    set(0, "DiffChange", {fg = , bg = ,}) --diff mode: Changed Line
    set(0, "DiffDelete", {fg = , bg = ,}) -- diff mode: Deleted line
    set(0, "DiffText", {fg = , bg = ,}) -- diff mode: Changed text within a changed line |diff.txt|

end

return M
