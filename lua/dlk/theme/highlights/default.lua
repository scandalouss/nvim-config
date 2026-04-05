local M = {}
local none = 'none'

function M.setup(palette, boldopt, italopt, underopt)
    local set = vim.api.nvim_set_hl -- so i dont have to type so much
    local pal = require("dlk.theme.colors."..palette)
    local config = {
        bold = boldopt,
        italics = italopt,
        underline = underopt
    }

    -- editor highlights
    set(0, "", {})
    set(0, "Normal", {fg = pal.fg1, bg = pal.bg1}) -- Normal Text
    set(0, "Terminal", {fg = pal.fg1 , bg = pal.bg1 ,}) -- Normal Text, but in the Terminal
    set(0, "EndOfBuffer", {fg = pal.bg4, bg = none,}) -- filler lines (~) after the end of the buffer. By default, uses |hl-NonText|
    set(0, "FoldColumn", {fg = pal.brights.gray, bg = none}) -- column where folds are displayed
    set(0, "Folded", {fg = pal.brights.gray, bg = none}) -- line used for closed folds
    set(0, "SignColumn", {link = "FoldColumn"}) -- column where |signs| are displayed
    set(0, "SignColumnSB", {link = "SignColumn"}) -- same as |hl-SignColumn|
    set(0, "ToolbarLine", {fg = pal.fg1})
    set(0, "ToolbarButton", {fg = pal.bg1, bg = pal.brights.blue,})
    set(0, "Cursor", {fg = pal.bg1, bg = pal.fg1,}) -- Character under the Cursor
    -- set(0, "ColorColumn", {fg = pal.fg1})
    set(0, "lCursor", {link = "Cursor"}) -- character under the cursor when |language-mapping| is used ("guicursor")
    set(0, "CursorIM", {link = "Cursor"}) -- character under the cursor when in IME mode
    set(0, "CurSearch", {fg = pal.bg1, bg = pal.brights.yellow,}) -- current match for the last search pattern ("hlsearch")
    set(0, "CursorColumn", {fg = pal.fg2, bg = none,}) -- used for columns set with "colorcolumn"
    set(0, "CursorLineNr", {fg = pal.brights.blue, bg = none,}) -- like LineNr when "cursorline" or "relativenumber" is set for the cursor line
    set(0, "LineNr", {fg = pal.normals.gray, bg = none,}) -- line number for ":number" and ":#" commands, and when "number" or "relativenumber" is set
    set(0, "Conceal", {fg = pal.fg1, bg = none,}) -- placeholder characters substituted for concealed text ("conceallevel")
    set(0, "Directory", {fg = pal.brights.blue}) -- directory names (and other special names in listings)
    set(0, "ErrorMsg", {fg = pal.brights.red, bg = none, bold = config.bold}) -- error messages on the command line
    set(0, "WarningMsg", {fg = pal.brights.yellow, bg = none}) -- warning messages
    set(0, "MoreMsg", {fg = pal.brights.cyan, bg = none, bold = config.bold}) -- |more-prompt|
    set(0, "ModeMsg", {fg = pal.brights.green, bg = none, bold = config.bold}) -- 'showmode' message (e.g., "--INSERT--")
    set(0, "IncSearch", {link = "CurSearch"}) -- 'incsearch' highlighting; also used for the text replaced with ":s///c"
    set(0, "Search", {fg = pal.fg1, bg = pal.normals.yellow,}) -- Last serach pattern highlighting. Also used for similar items that need to stand out.
    set(0, "Substitute", {link = "Search"}) -- |:substitute| replacement text highlighting
    set(0, "MatchParen", {fg = pal.fg1, bg = pal.bg4}) -- the Character under the cursor or just before it, if it is a paired bracket, and its match
    set(0, "NonText", {fg = pal.fg4, bg = none}) -- '@' at the end of the window, characters from 'showbreak' and other characters that do not really exist in the text (e.g., ">" displayed when a double-wide character doesn't fit at the end of the line).
    set(0, "Whitespace", {link = "NonText"}) -- "nbsp", "space", "tab", and "trail" in "listchars"
    set(0, "SpecialKey", {fg = pal.fg2, bg = pal.bg2,}) -- Unprintable characters: text displaced differently from what it really is. But not 'listchars' whitespace.
    set(0, "Pmenu", {fg = pal.fg1, bg = pal.bg1,}) -- Popup Menu: normal item
    set(0, "PmenuSbar", {link = "Pmenu"}) -- Popup Menu: Scrollbar
    set(0, "PmenuSel", {fg = pal.bg1, bg = pal.fg4,}) -- Popump Menu: Selected item
    set(0, "PmenuThumb", {fg = pal.fg1, bg = pal.bg2}) -- Popup Menu: Thumb of the Scrollbar
    set(0, "WildMenu", {link = "PmenuSel"}) -- current match in 'wildmenu' completion
    set(0, "Question", {fg = pal.brights.cyan, bg = none,}) -- |hit-enter| prompt and yes-no questions
    set(0, "SpellBad", {fg = pal.brights.red, bg = none, underline = config.underline}) -- Word that is not recognized by the spellchecker
    set(0, "SpellCap", {fg = pal.brights.blue, bg = none, underline = config.underline}) -- Word that should start with a capital.
    set(0, "SpellLocal", {fg = pal.brights.yellow, bg = none, underline = config.underline}) -- Word that is recognized by the spellchecker as one that is used in another region
    set(0, "SpellRare", {fg = pal.brights.green, bg = none, underline = config.underline}) -- Word that is recognized by the spellchecker as one that is hardly ever used
    set(0, "StatusLine", {fg = pal.fg1, bg = pal.normals.gray,}) -- status line of current window
    set(0, "StatusLineTerm", {link = "StatusLine"})
    set(0, "StatusLineNC", {fg = pal.bg2, bg = pal.bg3}) -- status lines of not-current windows Note: if this is equal to "StatusLine", vim will use "^^^" in the current window
    set(0, "StatusLineTermNC", {link = "StatusLineNC"})
    set(0, "TabLine", {fg = pal.fg1, bg = pal.bg3,}) -- tab pages line, not active tab page label
    set(0, "TabLineFill", {bg = pal.bg2,}) -- tabe pages line, where there are no labels
    set(0, "TabLineSel", {fg = pal.fg1, bg = pal.brights.red,}) -- tab pages line, active tab page label
    set(0, "WinSeperator", {fg = pal.fg3, bg = pal.bg3,}) -- the column separating vertically split windows
    set(0, "VertSplit", {link = "WinSeperator"}) -- same as |hl-WinSeperator|
    set(0, "Visual", {fg = pal.fg1, bg = pal.brights.gray,}) -- Visual mode selection
    set(0, "VisualNOS", {link = "Visual"}) -- Visual mode selection when vim is "Not owning the Selection"
    set(0, "QuickFixLine", {bg = pal.bg2,}) -- 
    set(0, "NormalFloat", {fg = pal.fg1, bg = pal.bg1,}) -- Normal Text in floating windows
    set(0, "FloatBorder", {link = "NormalFloat"})
    set(0, "WinBar", {bold = config.bold}) -- Window bar of current window.
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
    set(0, "Constant", {fg = pal.normals.magenta}) -- any constant
    set(0, "String", {fg = pal.normals.green}) -- a string constant: "this is a string"
    set(0, "Character", {link = "String"}) -- a character constant: "c", "\n"
    set(0, "Number", {link = "Constant"}) -- a number constant: 234, 0xff
    set(0, "Float", {link = "Constant"}) -- a floating point constant: 2.3e10
    set(0, "Boolean", {link = "Constant"}) -- a boolean constant: TRUE, false

    set(0, "Identifier", {fg = pal.normals.blue}) -- any variable name
    set(0, "Function", {fg = pal.normals.green, bold = config.bold}) -- function name (also: methods for classes)

    set(0, "Statement", {fg = pal.normals.red}) -- any statement
    set(0, "Conditional", {link = "Statement"}) -- if, then, else, endif, switch, etc.
    set(0, "Repeat", {link = "Statement"}) -- for, do, while, etc.
    set(0, "Label", {link = "Statement"}) -- case, dfefault, etc.

    set(0, "Operator", {fg = pal.normals.yellow}) -- "sizeof", "+", "*", etc.
    set(0, "Keyword", {link = "Operator"}) -- any other keyword
    set(0, "Exception", {link = "Operator"}) -- try, catch, throw

    set(0, "PreProc", {fg = pal.normals.cyan}) -- generic preprocessor statement
    set(0, "Include", {link = "PreProc"}) -- preprocessor #include 
    set(0, "Define", {link = "PreProc"}) -- preprocessor #define
    set(0, "Macro", {link = "PreProc"}) -- same as Define
    set(0, "PreCondit", {link = "PreProc"}) -- preprocessor #if, #else, #endif etc.
    set(0, "Structure", {link = "PreProc"}) -- struct, union, enum, etc.

    set(0, "Type", {fg = pal.normals.yellow, }) -- int, long, char, etc.
    set(0, "StorageClass", {link = "Type"}) -- static, register, volatile, etc.
    set(0, "Typedef", {link = "Type"}) -- typedef (like an alias)

    set(0, "Special", {fg = pal.normals.yellow}) -- any special symbol
    set(0, "SpecialChar", {link = "Special"}) -- Special Character in a constant
    set(0, "Tag", {link = "Special"}) -- you can use CTRL-] on this
    set(0, "Delimiter", {link = "Special"}) -- commas (,), semicolons (;), quotes (", '), braces ({}), and slashes (/)
    set(0, "SpecialComment", {link = "Special"}) -- special things inside a comment

    set(0, "Underlined", {underline = config.underline}) -- HTML links, standout text
    set(0, "Bold", {bold = config.bold})
    set(0, "Italic", {italic = true})

    set(0, "Error", {fg = pal.fg1, bg = pal.normals.red,}) -- any erroneous construct
    set(0, "Todo", {fg = pal.fg2}) -- for keywords TODO, FIXME, XXX :)
    set(0, "Debug", {fg = pal.normals.yellow}) -- debugging statements
    set(0, "debugPC", {fg = pal.normals.green}) -- used for highlighting the current line in terminal-debug
    set(0, "debugBreakpoint", {fg = pal.normals.red}) -- used for breakpoint colors in terminal-debug
    set(0, "Comment", {fg = pal.brights.gray, bg = none,}) -- any comment
    set(0, "Done", {fg = pal.brights.yellow}) -- 

    set(0, "diffAdded", {link = "DiffAdd"}) -- Added lines ("^+.*" | "^>.*")
    set(0, "diffRemoved", {link = "DiffDelete"}) -- Removed lines ("^-.*" | "^<.*")
    set(0, "diffChanged", {link = "DiffChange"}) -- Changed lines ("^! .*")
    set(0, "diffOldFile", {fg = pal.normals.yellow}) -- Old file that is being diff against
    set(0, "diffNewFile", {fg = pal.normals.magenta}) -- New file that is being compared to the old file
    set(0, "diffFile", {link = "diffOldFile"}) -- The filename of tghe diff ("diff --git a/readme.md b/readme.md")
    set(0, "diffLine", {fg = pal.normals.blue}) -- Line information ("@@ -169,6 +169,9 @@")
    set(0, "diffIndexLine", {link = "DiffChange"}) -- Index line of diff ("index bf3763d..94f0f62 100644")


    -- plugin highlight groups

    --indentblankline
    set(0, "@ibl.indent.char.1", {link = "NonText"})
    set(0, "@ibl.whitespace.char.1", {link = "NonText"})
    set(0, "@ibl.scope.char.1", {link = "Special"})
    set(0, "@ibl.scope.underline.1", {fg = pal.fg1, underline = true, sp = pal.brights.cyan})

    --neogit
    set(0, "NeogitFloatHeader", {fg = pal.brights.cyan})
    set(0, "NeogitPopupActionKey", {fg = pal.brights.cyan})
    set(0, "NeogitPopupOptionKey", {fg = pal.brights.cyan})
    set(0, "NeogitPopupConfigKey", {fg = pal.brights.cyan})
    set(0, "NeogitPopupSwitchKey", {fg = pal.brights.cyan})
    set(0, "NeogitSectionHeader", {fg = pal.brights.cyan, bold = config.bold})
    set(0, "NeogitBranch", {fg = pal.brights.cyan})
    set(0, "NeogitRemote", {fg = pal.brights.green})
    set(0, "NeogitChangeModified", {fg = pal.brights.blue})
    set(0, "NeogitChangeAdded", {fg = pal.brights.green})
    set(0, "NeogitChangeDeleted", {fg = pal.brights.red})
    set(0, "NeogitChangeRenamed", {fg = pal.brights.magenta})
    set(0, "NeogitChangeUpdated", {fg = pal.brights.cyan})
    set(0, "NeogitChangeCopied", {fg = pal.brights.yellow})
    set(0, "NeogitChangeNewFile", {fg = pal.brights.green})
    set(0, "NeogitChangeUnmerged", {fg = pal.brights.gray})
    set(0, "NeogitDiffAdd", {fg = pal.brights.green})
    set(0, "NeogitDiffDelete", {fg = pal.brights.red})
    set(0, "NeogitDiffDeletions", {fg = pal.brights.red})
    set(0, "NeogitDiffAddHighlight", {fg = pal.brights.green})
    set(0, "NeogitDiffDeleteHighlight", {fg = pal.brights.red})

    --neotree
    set(0, "NeoTreeGitUntracked", {fg = pal.brights.yellow})
    set(0, "NeoTreeGitConflict", {fg = pal.brights.yellow})

    --mini.nvim
    set(0, "MiniStatusLineFilename", {link = "StatusLine"})
    set(0, "MiniStatuslineModeNormal", {link = "NormalMode"})
    set(0, "MiniStatuslineModeInsert", {link = "InsertMode"})
    set(0, "MiniStatuslineModeVisual", {link = "VisualMode"})
    set(0, "MiniStatuslineModeReplace", {link = "ReplaceMode"})
    set(0, "MiniStatuslineModeCommand", {link = "CommandMode"})
    set(0, "MiniStatuslineModeOther", {link = "IncSearch"})

    --get highlighting on the number lines for diagnostics
    vim.diagnostic.config({
        signs = {
            numhl = {
                [vim.diagnostic.severity.WARN] = "DiagnosticWarn",
                [vim.diagnostic.severity.ERROR] = "DiagnosticError",
                [vim.diagnostic.severity.HINT] = "DiagnosticHint",
                [vim.diagnostic.severity.INFO] = "DiagnosticInfo",
            }
        }
    })
end


return M
