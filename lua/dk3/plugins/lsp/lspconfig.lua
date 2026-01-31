 return {
    {
        'neovim/nvim-lspconfig',
        dependencies = {
            {'williamboman/mason.nvim'},
            {'williamboman/mason-lspconfig.nvim'},
        },
        event="VeryLazy",
        priority = 50,
        config = function()

            require('mason').setup()
            require('mason-lspconfig').setup({
                automatic_enable = true,
                ensure_installed= {
                    "lua_ls",
                    "clangd",
                    "gopls",
                    "cssls",
                    "bashls",
                    "pyright",
                    "html",
                    "cmake",
                    "autotools_ls",
                    "csharp_ls",

                },
                handlers = {
                    -- default handler
                    function(server_name)
                        vim.lsp.enable(server_name)
                    end,
                },
            })
        end
    }
}
