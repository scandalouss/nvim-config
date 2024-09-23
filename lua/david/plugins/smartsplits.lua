return{
    "mrjones2014/smart-splits.nvim",
    lazy=false,
    config=function()
        local split=require("smart-splits")
        split.setup{}

    end
}
