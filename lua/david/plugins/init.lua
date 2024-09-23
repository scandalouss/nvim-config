return{
    {"gentoo/gentoo-syntax", event={"BufReadPre","BufNewFile"}},
    {
        "m4xshen/smartcolumn.nvim",
        event="VeryLazy",
        config=function()
            local smartcolumn=require("smartcolumn")
            smartcolumn.setup{
                colorcolumn="80",
                scope="line",
                disabled_filetypes={
                    "help",
                    "text",
                    "markdown",
                    "alpha",
                    "NvimTree",
                }
            }
        end
    },
}
