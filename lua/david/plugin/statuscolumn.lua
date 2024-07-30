local colorcolumn=require("smartcolumn")
local statuscol=require("statuscol")
local ufo=require("ufo")
local builtin=require("statuscol.builtin")

--initial column stuff
vim.o.foldcolumn="1"
vim.o.signcolumn="yes"
vim.o.foldlevel=99
vim.o.foldlevelstart=99
vim.o.foldenable=true
vim.lsp.diagnostic.enable=true

--set icons for diagnostics
vim.fn.sign_define("DiagnosticSignError", {text="󰅙"})
vim.fn.sign_define("DiagnosticSignHint", {text="󰌵"})
vim.fn.sign_define("DiagnosticSignInfo", {text=""})
vim.fn.sign_define("DiagnosticSignWarn", {text=""})

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
    relculright=true,
    segments={
        {text={builtin.foldfunc}, click="v:lua.ScFa"},
        {sign={namespace={"diagnostic"}, maxwidth=2, auto=true}, click="v:lua.ScSa", text={"%s"}},
        {text={builtin.lnumfunc," "}, click ="v:lua.ScLa"},
    }
}
ufo.setup({
    provider_selector = function(_,_,_)
        return {'treesitter', 'indent'}
    end
})
