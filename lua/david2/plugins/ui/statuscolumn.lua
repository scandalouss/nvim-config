-- the column right behind all the text your typing
return{
    "luukvbaal/statuscol.nvim",
    event="VeryLazy",
    config=function()
        local statuscol=require("statuscol")
        local builtin=require("statuscol.builtin")

        --initial column stuff
        vim.o.foldcolumn="1"
        vim.o.signcolumn="yes"
        vim.o.foldlevel=99
        vim.o.foldlevelstart=99
        vim.o.foldenable=true
        vim.lsp.diagnostic.enable=true

        --set icons for diagnostics
        vim.fn.sign_define("DiagnosticSignError", {text=""})
        vim.fn.sign_define("DiagnosticSignHint", {text="󰌵"})
        vim.fn.sign_define("DiagnosticSignInfo", {text=""})
        vim.fn.sign_define("DiagnosticSignWarn", {text="󱈸"})
        statuscol.setup{
            relculright=true,
            segments={
                {text={builtin.foldfunc}, click="v:lua.ScSa"},
                {sign={namespace={"diagnostic"}, maxwidth=2, auto=true}, text={"%s"}, click="v:lua.ScSa"},
                {text={builtin.lnumfunc,"│ "}, click ="v:lua.ScLa"}, -- short space
                --{text={builtin.lnumfunc,"│ "}, click ="v:lua.ScLa"}, -- real space
            },
            ft_ignore={"neo-tree","alpha","Alpha"}
        }
    end
}
