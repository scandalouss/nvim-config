return{
    "lewis6991/gitsigns.nvim",
    event={"BufReadPre","BufNewFile"},
    opts={
        on_attach=function(bufnr)
            local gs=package.loaded.gitsigns
            local git=require("gitsigns")
            git.setup()
        end
    }
}
