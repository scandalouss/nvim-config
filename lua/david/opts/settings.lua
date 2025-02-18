--ALL VIM EDITOR OPTIONS/VIM PLUGIN OPTIONS
--THAT AREN'T LUA GO HERE

--theme stuff
vim.cmd("syntax on") --syntax highlighting
vim.opt.termguicolors=true --good colors

--these 4 lines are for a transparent background
vim.cmd("highlight Normal guibg=none")
vim.cmd("highlight Normal ctermbg=none")
vim.cmd("highlight NonText guibg=none")
vim.cmd("highlight NonText ctermbg=none")

--main settings
vim.opt.nu=true --line numbers
vim.opt.tabstop=4 --indent 4 lines
vim.opt.softtabstop=4 --use a combo of tabs+spaces, if the file has tabs 
vim.opt.shiftwidth=4 --shift 4 lines when pressinng tab
vim.opt.expandtab=true --use spaces for tabs
vim.opt.smartindent=true -- smart auto-indentation when going to a new line
vim.opt.wrap=false --no line wrap
vim.opt.swapfile=false --turn off swapfile
vim.opt.backup=false --turn off backups
vim.opt.guicursor="" --keep the fat white cursor block instead of the line
vim.opt.updatetime=50 --update F A S T E R
vim.opt.lazyredraw=true --makes redrawing better? dunno about this one
vim.opt.splitbelow=true --when making a new horizontal split, split it below
vim.opt.mouse="" -- TURN OFF THE MOUSE, DON'T EVEN THINK ABOUT IT MFER
vim.opt.clipboard="unnamedplus" -- use system clipboard
vim.opt.conceallevel=2 -- make concealled text completely hidden so folds work

--turn on spellcheck and linewrapping for markdown files ONLY
vim.api.nvim_create_autocmd("FileType", {
  pattern = "markdown",
  callback = function()
    vim.opt_local.spell = true
    vim.opt_local.wrap = true
  end
})

--indent 2 spaces instead of 4 for html files
vim.api.nvim_create_augroup("setIndent", {clear = true})
vim.api.nvim_create_autocmd("Filetype", {
    group = "setIndent",
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
