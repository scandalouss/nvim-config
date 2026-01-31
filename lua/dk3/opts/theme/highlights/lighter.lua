local M = {}
local config = require("dk3.opts.theme.settings")
local none = 'none'

function M.setup()
    local set = vim.api.nvim_set_hl -- so i dont have to type so much
    local pal = require("dk3.opts.theme.colors."..config.palette)

    -- editor highlights
    set(0, "Normal", {fg = pal.fg1, bg = pal.bg1}) -- Normal Text
    set(0, "Terminal", {fg = pal.fg1 , bg = pal.bg1 ,}) -- Normal Text, but in the Terminal
    set(0, "EndOfBuffer", {fg = pal.bg4, bg = none,}) -- filler lines (~) after the end of the buffer. By default, uses |hl-NonText|
    set(0, "FoldColumn", {link = "Normal"}) -- column where folds are displayed
    set(0, "Folded", {fg = pal.fg4, bg = none,}) -- line used for closed folds
    set(0, "SignColumn", {link = "FoldColumn"}) -- column where |signs| are displayed
    set(0, "SignColumnSB", {link = "SignColumn"}) -- same as |hl-SignColumn|
    set(0, "ToolbarLine", {fg = pal.fg})
    set(0, "ToolbarButton", {fg = pal.bg1, bg = pal.normals.blue,})
    set(0, "Cursor", {fg = pal.bg1, bg = pal.fg1,}) -- Character under the Cursor
    set(0, "lCursor", {link = "Cursor"}) -- character under the cursor when |language-mapping| is used ("guicursor")
    set(0, "CursorIM", {link = "Cursor"}) -- character under the cursor when in IME mode
    set(0, "CurSearch", {fg = pal.fg1, bg = pal.normals.yellow,}) -- current match for the last search pattern ("hlsearch")
    set(0, "CursorColumn", {fg = pal.fg2, bg = none,}) -- used for columns set with "colorcolumn"
    set(0, "CursorLineNr", {fg = pal.normals.blue, bg = none,}) -- like LineNr when "cursorline" or "relativenumber" is set for the cursor line
    set(0, "LineNr", {fg = pal.fg2, bg = none,}) -- line number for ":number" and ":#" commands, and when "number" or "relativenumber" is set
    set(0, "Conceal", {fg = pal.fg1, bg = none,}) -- placeholder characters substituted for concealed text ("conceallevel")
    set(0, "Directory", {fg = pal.normals.cyan, bg = none,}) -- directory names (and other special names in listings)
    set(0, "ErrorMsg", {fg = pal.normals.red, bg = pal.bg2, bold = true}) -- error messages on the command line
    set(0, "WarningMsg", {fg = pal.fg1, bg = pal.normals.yellow,}) -- warning messages
    set(0, "MoreMsg", {fg = pal.brights.green, bg = none, bold = true}) -- |more-prompt|
    set(0, "ModeMsg", {fg = pal.normals.yellow, bg = none, bold = true}) -- 'showmode' message (e.g., "--INSERT--")
    set(0, "IncSearch", {fg = pal.fg1, bg = pal.normals.magenta,}) -- 'incsearch' highlighting; also used for the text replaced with ":s///c"
    set(0, "Search", {fg = pal.fg1, bg = pal.normals.red,}) -- Last serach pattern highlighting. Also used for similar items that need to stand out.
    set(0, "Substitute", {link = "Search"}) -- |:substitute| replacement text highlighting
    set(0, "MatchParen", {fg = pal.brights.blue, bg = none,}) -- the Character under the cursor or just before it, if it is a paired bracket, and its match
    set(0, "NonText", {fg = pal.bg4, bg = pal.bg2,}) -- '@' at the end of the window, characters from 'showbreak' and other characters that do not really exist in the text (e.g., ">" displayed when a double-wide character doesn't fit at the end of the line).
    set(0, "Whitespace", {link = "NonText"}) -- "nbsp", "space", "tab", and "trail" in "listchars"
    set(0, "SpecialKey", {fg = pal.fg2, bg = pal.bg2,}) -- Unprintable characters: text displaced differently from what it really is. But not 'listchars' whitespace.
    set(0, "Pmenu", {fg = pal.fg1, bg = pal.bg2,}) -- Popup Menu: normal item
    set(0, "PmenuSbar", {bg = pal.bg2,}) -- Popup Menu: Scrollbar
    set(0, "PmenuSel", {bg = pal.bg3,}) -- Popump Menu: Selected item
    set(0, "PmenuThumb", {link = "PmenuSel"}) -- Popup Menu: Thumb of the Scrollbar
    set(0, "WildMenu", {fg = pal.normals.green, bg = pal.bg1,}) -- current match in 'wildmenu' completion
    set(0, "Question", {fg = pal.brights.cyan, bg = none,}) -- |hit-enter| prompt and yes-no questions
    set(0, "SpellBad", {fg = pal.brights.red, bg = none, underline = true}) -- Word that is not recognized by the spellchecker
    set(0, "SpellCap", {fg = pal.brights.blue, bg = none, underline = true}) -- Word that should start with a capital.
    set(0, "SpellLocal", {fg = pal.brights.yellow, bg = none, underline = true}) -- Word that is recognized by the spellchecker as one that is used in another region
    set(0, "SpellRare", {fg = pal.brights.green, bg = none, underline = true}) -- Word that is recognized by the spellchecker as one that is hardly ever used
    set(0, "StatusLine", {fg = pal.bg2, bg = pal.bg3,}) -- status line of current window
    set(0, "StatusLineTerm", {link = "StatusLine"})
    set(0, "StatusLineNC", {link = "StatusLine"}) -- status lines of not-current windows Note: if this is equal to "StatusLine", vim will use "^^^" in the current window
    set(0, "StatusLineTermNC", {link = "StatusLineNC"})
    set(0, "TabLine", {fg = pal.fg1, bg = pal.bg3,}) -- tab pages line, not active tab page label
    set(0, "TabLineFill", {bg = pal.bg2,}) -- tabe pages line, where there are no labels
    set(0, "TabLineSel", {fg = pal.fg1, bg = pal.brights.red,}) -- tab pages line, active tab page label
    set(0, "WinSeperator", {fg = pal.fg3, bg = pal.bg3,}) -- the column separating vertically split windows
    set(0, "VertSplit", {link = "WinSeperator"}) -- same as |hl-WinSeperator|
    set(0, "Visual", {fg = pal.bg1, bg = pal.fg1,}) -- Visual mode selection
    set(0, "VisualNOS", {link = "Visual"}) -- Visual mode selection when vim is "Not owning the Selection"
    set(0, "QuickFixLine", {bg = pal.bg2,}) -- 
    set(0, "FloatBorder", {fg = pal.normals.blue, bg = pal.bg3,})
    set(0, "NormalFloat", {fg = pal.fg1, bg = pal.bg3,}) -- Normal Text in floating windows
    set(0, "WinBar", {bold = true}) -- Window bar of current window.
    set(0, "WinBarNC", {bold = false}) -- Window bar of not-current windows

    set(0, "DiffAdd", {fg = pal.normals.green, bg = none,}) -- diff mode: Added line
    set(0, "DiffChange", {fg = pal.normals.yellow, bg = none,}) --diff mode: Changed Line
    set(0, "DiffDelete", {fg = pal.normals.red, bg = none,}) -- diff mode: Deleted line
    set(0, "DiffText", {fg = pal.normals.cyan, bg = none,}) -- diff mode: Changed text within a changed line |diff.txt|

    set(0, "NormalMode", {fg = none, bg = pal.normals.cyan,})
    set(0, "VisualMode", {fg = none, bg = pal.normals.magenta,})
    set(0, "InsertMode", {fg = none, bg = pal.normals.green,})
    set(0, "CommandMode", {fg = none, bg = pal.normals.red,})

    -- syntax highlights
    set(0, "Constant", {fg = pal.normals.cyan}) -- any constant
    set(0, "String", {fg = pal.normals.green}) -- a string constant: "this is a string"
    set(0, "Character", {link = "String"}) -- a character constant: "c", "\n"
    set(0, "Number", {link = "Constant"}) -- a number constant: 234, 0xff
    set(0, "Float", {link = "Constant"}) -- a floating point constant: 2.3e10
    set(0, "Boolean", {link = "Constant"}) -- a boolean constant: TRUE, false

    set(0, "Identifier", {fg = pal.normals.blue}) -- any variable name
    set(0, "Function", {fg = pal.normals.blue, bold = true}) -- function name (also: methods for classes)

    set(0, "Statement", {fg = pal.normals.blue}) -- any statement
    set(0, "Conditional", {link = "Statement"}) -- if, then, else, endif, switch, etc.
    set(0, "Repeat", {link = "Statement"}) -- for, do, while, etc.
    set(0, "Label", {fg = pal.normals.cyan}) -- case, default, etc.
    set(0, "Keyword", {link = "Statement"}) -- any other keyword

    set(0, "Operator", {fg = pal.normals.yellow}) -- "sizeof", "+", "*", etc.
    set(0, "Exception", {link = "Operator"}) -- try, catch, throw

    set(0, "PreProc", {fg = pal.normals.red}) -- generic preprocessor statement
    set(0, "Include", {fg = pal.normals.blue}) -- preprocessor #include 
    set(0, "Define", {fg = pal.normals.cyan}) -- preprocessor #define
    set(0, "Macro", {link = "Define"}) -- same as Define
    set(0, "PreCondit", {link = "Define"}) -- preprocessor #if, #else, #endif etc.
    set(0, "Structure", {link = "Normal"}) -- struct, union, enum, etc.

    set(0, "Type", {fg = pal.normals.cyan, }) -- int, long, char, etc.
    set(0, "StorageClass", {link = "Type"}) -- static, register, volatile, etc.
    set(0, "Typedef", {link = "Type"}) -- typedef (like an alias)

    set(0, "Special", {fg = pal.brights.gray}) -- any special symbol
    set(0, "SpecialChar", {fg = pal.normals.cyan}) -- Special Character in a constant
    set(0, "Tag", {fg = pal.normals.yellow}) -- you can use CTRL-] on this
    set(0, "Delimiter", {fg = pal.brights.gray}) -- commas (,), semicolons (;), quotes (", '), braces ({}), and slashes (/)
    set(0, "SpecialComment", {link = "Special"}) -- special things inside a comment

    set(0, "Underlined", {underline = true}) -- HTML links, standout text
    set(0, "Bold", {bold = true})
    set(0, "Italic", {italic = true})

    set(0, "Error", {fg = pal.fg1, bg = pal.normals.red,}) -- any erroneous construct
    set(0, "Todo", {fg = pal.fg2}) -- for keywords TODO, FIXME, XXX :)
    set(0, "Debug", {fg = pal.normals.yellow}) -- debugging statements
    set(0, "debugPC", {fg = pal.normals.green}) -- used for highlighting the current line in terminal-debug
    set(0, "debugBreakpoint", {fg = pal.normals.red}) -- used for breakpoint colors in terminal-debug
    set(0, "Comment", {fg = pal.normals.gray, bg = none,}) -- any comment
    set(0, "Done", {fg = pal.brights.yellow}) -- 

    set(0, "diffAdded", {link = "DiffAdd"}) -- Added lines ("^+.*" | "^>.*")
    set(0, "diffRemoved", {link = "DiffDelete"}) -- Removed lines ("^-.*" | "^<.*")
    set(0, "diffChanged", {link = "DiffChange"}) -- Changed lines ("^! .*")
    set(0, "diffOldFile", {fg = pal.normals.yellow}) -- Old file that is being diff against
    set(0, "diffNewFile", {fg = pal.normals.magenta}) -- New file that is being compared to the old file
    set(0, "diffFile", {link = "diffOldFile"}) -- The filename of tghe diff ("diff --git a/readme.md b/readme.md")
    set(0, "diffLine", {fg = pal.normals.blue}) -- Line information ("@@ -169,6 +169,9 @@")
    set(0, "diffIndexLine", {link = "DiffChange"}) -- Index line of diff ("index bf3763d..94f0f62 100644")
end


return M
