local M = {}

local settings = {
    highlights = "minimal",
    palette = "gentoo3",
    bold = true,
    italics = true,
    underline = true
}

function M.setup()
    local theme = require("dlk.theme.highlights."..settings.highlights)

    if vim.g.colors_name then
        vim.cmd "hi clear"
    end

    vim.g.colors_name = settings.palette.."-"..settings.highlights

    theme.setup(settings.palette, settings.bold, settings.italics, settings.underline)
end

return M
