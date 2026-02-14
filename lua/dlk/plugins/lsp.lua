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

vim.lsp.enable(lspconfigs)
