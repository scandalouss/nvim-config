--literally just have this to get zoom functionality within neovim
--zoom = when there's multiple split windows, focuses and fullscreens 1 pane
return{
    "pocco81/true-zen.nvim",
    event = "VeryLazy",
    config = function()
        local truezen = require("true-zen")
        truezen.setup{}
    end
}
