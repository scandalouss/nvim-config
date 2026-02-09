vim.pack.add({"https://github.com/nvim-treesitter/nvim-treesitter"})

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
