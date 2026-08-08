--- lsp stuff
vim.pack.add{
  "https://github.com/neovim/nvim-lspconfig",
  "https://github.com/nvim-treesitter/nvim-treesitter",
}

-- lsp
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
-- treesitter
local tsparsers = {
    "asm",
    "bash",
    "c",
    "c_sharp",
    "cmake",
    "cpp",
    "css",
    "git_config",
    "git_rebase",
    "gitattributes",
    "gitcommit",
    "gitignore",
    "go",
    "scheme",
    "html",
    "http",
    "java",
    "javascript",
    "json",
    "llvm",
    "lua",
    "make",
    "markdown",
    "markdown_inline",
    "php",
    "poe_filter", --LMFAO
    "python",
    "regex",
    "rust",
    "toml",
    "typescript",
    "vim",
    "vimdoc",
    "xml",
    "yaml",
    "zsh"
}

local nts = require("nvim-treesitter")
nts.install(tsparsers)
--autocmd('PackChanged', { callback = function() nts.update() end

--start tree-sitter
vim.api.nvim_create_autocmd("FileType", {
  callback = function(args)
    local filetype = args.match
    local lang = vim.treesitter.language.get_lang(filetype)
    if vim.treesitter.language.add(lang) then
      vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
      vim.treesitter.start()
    end
  end
})

--start lsp
vim.lsp.enable(lspconfigs)
