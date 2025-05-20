return{
    "chentoast/marks.nvim",
    event="VeryLazy",
    config = function()
        local marks = require("marks")
        marks.setup{}
    end
}
