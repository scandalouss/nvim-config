-- language server protocol, makes stuff like code completion and highlighting slick
return{
    "neovim/nvim-lspconfig",
    event={"BufReadPre","BufNewFile",},
    dependencies={
        "hrsh7th/cmp-nvim-lsp",
        {"antosha417/nvim-lsp-file-operations",config=true},
        {"folke/neodev.nvim",opts={}},
    },
    config=function()
        local lspconfig=require("lspconfig")
        local mason_lspconfig=require("mason-lspconfig")
        local cmp_nvim_lsp=require("cmp_nvim_lsp")
        vim.api.nvim_create_autocmd("LspAttach",{
            group=vim.api.nvim_create_augroup("UserLspConfig",{}),
            callback=function(ev)
                local opts={buffer=ev.buf, silent=true}
                --keybinds go here
            end,
        })
        local capabilities=cmp_nvim_lsp.default_capabilities()
        mason_lspconfig.setup_handlers({
            function(server_name)
                lspconfig[server_name].setup({
                    capabilities=capabilities,
                })
            end,
        })
    end,
}
