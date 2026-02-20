vim.pack.add({"https://github.com/neovim/nvim-lspconfig",})

--enable lsp
local lspconfigs = {
    "asm_lsp",
    "autotools_ls",
    "basedpyright",
    "bashls",
    "clangd",
    "cmake",
    "csharp_ls",
    "cssls",
    "gopls",
    "html",
    "java_language_server",
    "lua_ls",
    "markdown_oxide",
}

vim.lsp.config("basedpyright", {
    handlers = {
        -- filter noisy notifications
        ['$/progress'] = function(err, result, ctx)
            -- just notify once
            if result.token == (vim.g.basedpyright_progress_token or result.token) then
                vim.g.basedpyright_progress_token = result.token
                vim.lsp.handlers['$/progress'](err, result, ctx)
            end
        end,
    },
})

vim.lsp.config("lua_ls", {
    settings = {
        Lua = {
            runtime = {
                -- Tell the language server which version of Lua you're using
                -- (most likely LuaJIT in the case of Neovim)
                version = 'LuaJIT',
            },
            diagnostics = {
                -- Get the language server to recognize the `vim` global
                globals = {
                    'vim',
                    'require'
                },
            },
            workspace = {
                -- Make the server aware of Neovim runtime files
                library = vim.api.nvim_get_runtime_file("", true),
            },
            -- Do not send telemetry data containing a randomized but unique identifier
            telemetry = {
                enable = false,
            },
        },
    },
})

vim.lsp.enable(lspconfigs)
