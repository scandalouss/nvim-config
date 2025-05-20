--vim was bitching about this
vim.g.mapleader=" "

local lazypath=vim.fn.stdpath("data") .. "/lazy/lazy.nvim" if not (vim.uv or vim.loop).fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
    {import="david.plugins.ui"},
    {import="david.plugins.util"},
    {import="david.plugins.lsp"}},
    {
        defaults={lazy=true},
        performance={
            cache={enabled=true},
            rtp={disabled_plugins={
                "netrwPlugin",
                "gzip",
                "tarPlugin",
                "tohtml",
                "zipPlugin",
            }},
        },
    })
