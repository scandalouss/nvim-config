local lspzero=require("lsp-zero")
local lspconfig=require("lspconfig")
lspzero.on_attach(function(client,bufnr)
    lspzero.default_keymaps({buffer=bufnr})
end)

require("mason").setup()
require("mason-lspconfig").setup({
    ensure_installed={
        "clangd",
        "csharp_ls",
        "cssls",
        "cmake",
        "glsl_analyzer",
        "gopls",
        "jdtls",
        "tsserver",
        "jedi_language_server",
        "lemminx",
        "yamlls",
    },
    automatic_installation=true,
    handlers={
        function(server_name)
            require("lspconfig")[server_name].setup({})
        end,
    },
})
--server-specific stuff goes down here
lspconfig.lua_ls.setup{
    settings={
        Lua={
            diagnostics={
                globals={"vim","require"}
            }
        }
    }
}
