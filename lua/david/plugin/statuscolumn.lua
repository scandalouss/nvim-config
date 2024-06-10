local colorcolumn=require("smartcolumn")
local statuscol=require("statuscol")
local builtin=require("statuscol.builtin")

colorcolumn.setup{
    colorcolumn="80",
    scope="line",
    disabled_filetypes={
        "alpha",
        "help",
        "text",
        "markdown",
    }
}
statuscol.setup{
    relculright = true,
    segments = {
        { text = { builtin.foldfunc }, click = "v:lua.ScFa" },
        {
            sign = { name = { "Diagnostic" }, maxwidth = 1,},
            click = "v:lua.ScSa"
        },
        { text = { builtin.lnumfunc }, click = "v:lua.ScLa", },
        {
            sign = { name = { ".*" }, maxwidth = 1, colwidth = 1, wrap = true },
            click = "v:lua.ScSa"
        },
    }
}
