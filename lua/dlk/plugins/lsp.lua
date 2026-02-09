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

vim.lsp.enable(lspconfigs)
