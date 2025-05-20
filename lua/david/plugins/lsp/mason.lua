-- mason package manager to make downloading lsp stuff easier
return{
    "williamboman/mason-lspconfig.nvim",
    dependencies={
        "williamboman/mason.nvim",
    },
    event="VeryLazy",
    config=function()
        local mason=require("mason")
        local mason_lspconfig=require("mason-lspconfig")

        mason.setup()

        mason_lspconfig.setup({
            ensure_installed={
                "clangd",
                "csharp_ls",
                "cssls",
                "cmake",
                "glsl_analyzer",
                "gopls",
                "jdtls",
                "ts_ls",
                "jedi_language_server",
                "lemminx",
                "yamlls",
                "lua_ls",
            },
            automatic_installation=true,
            automatic_enable=true
        })
    
    end,
}
