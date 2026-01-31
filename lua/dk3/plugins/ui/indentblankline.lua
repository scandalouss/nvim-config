-- pretty colored lines to show indentation level
return{
    "lukas-reineke/indent-blankline.nvim",
    event={"BufReadPre","BufNewFile"},
    config=function()
        require("ibl").setup{
            indent={
                char="│",
                highlight="Folded"
            },
            whitespace = {
                highlight = "Folded"
            },
            scope={
                enabled=true,
                highlight="Function"
            }
        }
    end
}
