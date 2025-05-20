return{
    -- helpful ui for locating warnings/errors
    "folke/trouble.nvim",
    event="VeryLazy",
    dependencies={"folke/todo-comments.nvim"},
    config=function()
        local trouble=require("trouble")
        trouble.setup()
    end
}

