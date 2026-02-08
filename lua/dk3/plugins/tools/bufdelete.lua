return{
    "famiu/bufdelete.nvim",
    lazy = true,
    event = "VeryLazy",
    config = function()
        local bd = require("bufdelete")
    end
}
