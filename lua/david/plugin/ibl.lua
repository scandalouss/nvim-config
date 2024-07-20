local config=require("david.theme.config")
local options=config.options
local pal=require("david.theme.colors."..options.palette)

local highlight={
    "red",
    "orange",
    "yellow",
    "green",
    "blue",
    "cyan",
    "violet",
}

local hooks=require("ibl.hooks")
--highlight groups in ibl highlight setup hook
hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
    vim.api.nvim_set_hl(0,"red",{fg=pal.brights.red})
    vim.api.nvim_set_hl(0,"orange",{fg=pal.brights.magenta})
    vim.api.nvim_set_hl(0,"yellow",{fg=pal.brights.yellow})
    vim.api.nvim_set_hl(0,"green",{fg=pal.brights.green})
    vim.api.nvim_set_hl(0,"blue",{fg=pal.brights.blue})
    vim.api.nvim_set_hl(0,"cyan",{fg=pal.brights.cyan})
    vim.api.nvim_set_hl(0,"violet",{fg=pal.brights.white})
end)

require("ibl").setup{
    indent={
        char="│",
        highlight=highlight
    },
    scope={
        enabled=true
    }
}
