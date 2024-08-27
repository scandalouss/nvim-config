return{
    "stevearc/conform.nvim",
    event={"BufReadPre","BufNewFile"},
    config=function()
        local conform=require("conform")
        conform.setup({})
    end
}
