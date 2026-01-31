return{
    "fasterius/simple-zoom.nvim",
    lazy = false,
    config = function()
        local zoom = require("simple-zoom")
        zoom.setup{}
    end
}
