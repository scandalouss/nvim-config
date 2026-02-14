vim.pack.add({"https://github.com/j-hui/fidget.nvim"})

local fidget = require("fidget")

fidget.setup{
    notification = {
        override_vim_notify = true,
        view = {
            stack_upwards = false,
        },
        window = {
            winblend = 0,
            align = "top",
            normal_hl = "Normal",
        },
    },
}
-- vim.notify = fidget.nofity
