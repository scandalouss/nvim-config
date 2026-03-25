local M = {}

local settings = {
    highlights = "minimal",
    palette = "nvimlike",
    bold = true,
    italics = true,
    underline = true
}

function M.setup()
    local theme = require("dlk.theme.highlights."..settings.highlights)

    if vim.g.colors_name then
        vim.cmd "hi clear"
    end

    if vim.api.nvim_get_option "termguicolors" == false then
        vim.opt.termguicolors = true
    end

    vim.g.colors_name = settings.palette.."-"..settings.highlights

    theme.setup(settings.palette, settings.bold, settings.italics, settings.underline)
end

return M
