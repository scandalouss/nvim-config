return{
    "nvim-treesitter/nvim-treesitter",
    lazy = false,
    branch = "master",
    build = ":TSUpdate",
    config = function()
        local treesitter = require("nvim-treesitter.configs")
        treesitter.setup{
            ensure_installed = {
                "c",
                "cpp",
                "make",
                "cmake",
                "html",
                "css",
                "gitignore",
                "go",
                "lua",
                "vim",
                "vimdoc",
                "bash",
                "rust"
            },
            sync_install = false,
            auto_install = true,
            indent = {enable = true},
            highlight = {enable = true},
        }
    end
}
