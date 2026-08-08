---- round 8 billion
-- 7/8/26
local opt = vim.opt
local o = vim.o
local home = vim.env.HOME
local myautocommands = vim.api.nvim_create_augroup("MyAutoCommands", {clear = true})

require("dlk.plugins.lsp")
require("dlk.plugins.overseer")
require("dlk.plugins.dap")
require("dlk.plugins.utils")
require("dlk.remaps")

------------------
--|||settings|||--
------------------

--- basic shit
opt.nu = true				                  --line numbers
opt.cursorline = true			              --highlight current line
opt.wrap = false			                  --no line wrapping
opt.scrolloff = 10			                  --keep 10 lines above/below cursor
opt.sidescrolloff = 8			              --keep 8 columns left/right of cursor

--- indentation
opt.tabstop = 4                               --tab width
opt.softtabstop = 4                           --soft tab stop
opt.shiftwidth = 4                            --indent width
opt.expandtab = true                          --use spaces instead of tabs
opt.smartindent = true                        --smart auto-indenting
opt.autoindent = true                         --copy indent from current line

--- visual stuff
opt.signcolumn = "yes"                        --always show the sign column
opt.showmatch = true                          --highlight matching brackets
opt.guicursor = ""                            --get the block cursor
opt.completeopt = "menuone,noinsert,noselect" --completion options
opt.lazyredraw = true                         --don't redraw during macros
opt.synmaxcol = 300                           --syntax highlighting limit
opt.conceallevel = 2                          --make concealled text hidden so folds work

--- file shit
opt.backup = true                             --backups = on
opt.swapfile = true                           --swap/recovery file = on
opt.undofile = true                           --persistent undo = on
opt.backupdir = home.."/documents/nvim/backup"--backup directory
opt.directory = home.."/documents/nvim/swap"  --swap directory
opt.undodir = home.."/documents/nvim/undo"    --undo directory
opt.updatetime = 300                          --faster completion
opt.timeoutlen = 500                          --key timeout duration
opt.ttimeoutlen = 0                           --key code timeout
opt.autoread = true                           --auto reload files changed outside vim
opt.autowrite = false                         --don't auto save

--- behaviorial shit
opt.hidden = true                             --allow hidden buffers
opt.backspace = "indent,eol,start"            --better backspace behavior
opt.autochdir = false                         --dont autochange directory
opt.iskeyword:append("-")                     --treat dash as part of word
opt.modifiable = true                         --allow buffer modifications
opt.encoding = "UTF-8"                        --set encoding
opt.clipboard:append("unnamedplus")           --get the clipboard going
opt.mouse = ""                                --TURN OFF THE MOUSE DAMNIT
opt.splitbelow = true
opt.splitright = true

--- fold options
opt.foldcolumn = "1"                          --turn on fold column always
opt.foldlevel = 99                            --open all folds
opt.foldlevelstart = 99                       --open all folds on startup
opt.foldenable = true                         --turn on folds
opt.fillchars = [[eob: ,fold: ,foldopen:-,foldsep: ,foldclose:+,foldinner: ,]]

--- disable netrw, i tried :/
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

--- theme shit
if os.getenv("DISPLAY") == nil then 	     --check if were in TTY (if DISPLAY is empty, we're prolly in tty)
    vim.cmd("syntax on")
    opt.termguicolors = false
else
    vim.cmd("syntax on")
    opt.termguicolors = true
    require("dlk.theme").setup() 	         --my theme
    -- vim.cmd("colorscheme rasmus") 	     --not my theme

    --- transparent background
    --- uses whatever background your terminal is set to by default
    vim.cmd("highlight Normal guibg=none")
    vim.cmd("highlight Normal ctermbg=none")
    vim.cmd("highlight NonText guibg=none")
    vim.cmd("highlight NonText ctermbg=none")
end

--- autocomplete shit
o.autocomplete = true
o.complete = "o,.,w,b,u"
o.completeopt = "fuzzy,menuone,noselect,popup"
o.pumheight = 7
o.pummaxwidth = 80

vim.api.nvim_create_autocmd("LspAttach", {
    group = myautocommands,
    command = "setlocal complete=o"
})

vim.api.nvim_create_autocmd("LspAttach", {
    group = myautocommands,
    callback = function(ev)
        vim.lsp.completion.enable(true, ev.data.client_id, ev.buf)
    end
})

----------------------
--|||autocommands|||--
----------------------

--- turn on spellcheck and linewrapping for markdown files
vim.api.nvim_create_autocmd("FileType", {
    group = myautocommands,
    pattern = {"markdown"},
    callback = function()
        vim.opt_local.spell = true
        vim.opt_local.wrap = true
    end
})

--- indent 2 spaces instead of 4 for alotta files
vim.api.nvim_create_autocmd("Filetype", {
    group = myautocommands,
    pattern = {
        "html",
        "xml",
        "xhtml",
        "css",
        "scss",
        "javascript",
        "typescript",
        "yaml",
        "jsx",
        "tsx",
        "typescriptreact",
        "javascriptreact"
    },
    callback = function()
        vim.opt_local.tabstop = 2
        vim.opt_local.softtabstop = 2
        vim.opt_local.shiftwidth = 2
    end
})
