return{
    "folke/trouble.nvim",
    opts = {}, -- for default options, refer to the configuration section for custom setup.
    event="VeryLazy",
    config=function()
        local trouble=require("trouble")
        trouble.setup{}
    end
}
