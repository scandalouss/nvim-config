-- notification system
return{
    "j-hui/fidget.nvim",
    event="VeryLazy",
    config=function()
        local fidget=require("fidget")
        fidget.setup{
            notification={
                override_vim_notify=true,
                view={
                    stack_upwards=false,
                },
                window={
                    winblend=0,
                    align="top",
                    normal_hl="Normal",
                },
            },
            integration={
                ["nvim-tree"]={
                    enable=true
                }
            }
        }
        vim.notify=fidget.notify
    end
}
