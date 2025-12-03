return{
    --"folke/neodev.nvim",
    "folke/lazydev.nvim",
    ft="lua",
    config=function ()
        local lazydev=require("lazydev")
        lazydev.setup{}
    end
}
