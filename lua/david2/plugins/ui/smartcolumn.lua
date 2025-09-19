return    {
    -- adds a colored bar after a specified number of characters
    "m4xshen/smartcolumn.nvim",
    event={"BufReadPre","BufNewFile"},
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
                "trouble",
                "Lazy",
                "Mason",
            }
        }
    end
}
