return{
    "stevearc/conform.nvim",
    lazy=false,
    event={"BufReadPre","BufNewFile"},
    config=function()
        local conform=require("conform")
        conform.setup({})
    end
}
