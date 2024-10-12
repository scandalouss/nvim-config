--ALL VIM EDITOR OPTIONS/VIM PLUGIN OPTIONS
--THAT AREN'T LUA GO HERE

--theme stuff
--vim.cmd("colorscheme gruvbox") -- gruvbox for the laptop
vim.cmd("syntax on") --syntax highlighting

    --these 4 lines are for a transparent background
vim.cmd("highlight Normal guibg=none")
vim.cmd("highlight Normal ctermbg=none")
vim.cmd("highlight NonText guibg=none")
vim.cmd("highlight NonText ctermbg=none")

vim.opt.termguicolors=true --good colors

--main settings
vim.opt.nu=true --line numbers
vim.opt.tabstop=4 --indent 4 lines
vim.opt.softtabstop=4 --use a combo of tabs+spaces, if the file has tabs 
vim.opt.shiftwidth=4 --shift 4 lines when pressinng tab
vim.opt.expandtab=true --use spaces for tabs
vim.opt.smartindent=true --indentation around {} and () i think
vim.opt.wrap=false --no line wrap
vim.opt.swapfile=false --turn off swapfile
vim.opt.backup=false --turn off backups
vim.opt.guicursor="" --keep the fat white cursor block instead of the line
vim.opt.updatetime=50 --update F A S T E R
vim.opt.lazyredraw=true --makes redrawing better? dunno about this one
vim.opt.splitbelow=true --when making a new horizontal split, split it below
vim.opt.mouse="" -- TURN OFF THE MOUSE, DON'T EVEN THINK ABOUT IT MFER
vim.opt.clipboard="unnamedplus"

vim.opt.conceallevel=2
