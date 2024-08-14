return{
    "folke/trouble.nvim",
    lazy=false,
    dependencies={"folke/todo-comments.nvim"},
    config=function()
        local trouble=require("trouble")
        trouble.setup()
    end
}
