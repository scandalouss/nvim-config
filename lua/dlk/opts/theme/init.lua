local M = {}
local settings = require ("dlk.opts.theme.settings")

function M.setup()
    local theme = require("dlk.opts.theme.highlights."..settings.highlights)

    if vim.g.colors_name then
        vim.cmd "hi clear"
    end

    if vim.api.nvim_get_option "termguicolors" == false then
        vim.opt.termguicolors = true
    end

    vim.g.colors_name = settings.palette.."-"..settings.highlights

    theme.setup()
end

M.setup()

return M
