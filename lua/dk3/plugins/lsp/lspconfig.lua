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
