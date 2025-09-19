return{
    "fasterius/simple-zoom.nvim",
    event="VeryLazy",
    config=function()
        local zoom = require("simple-zoom")
        zoom.setup{}
    end
}
