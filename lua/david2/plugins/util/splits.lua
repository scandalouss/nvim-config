return{
    -- better pane management/wezterm integration
    "mrjones2014/smart-splits.nvim",
    event="VeryLazy",
    config=function()
        local split=require("smart-splits")
        split.setup{}
    end
}
