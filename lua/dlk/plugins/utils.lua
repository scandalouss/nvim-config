vim.pack.add({
    "https://github.com/nvim-lua/plenary.nvim",
    "https://github.com/famiu/bufdelete.nvim",
    "https://github.com/mrjones2014/smart-splits.nvim",
    "https://github.com/fasterius/simple-zoom.nvim",
    "https://github.com/RaafatTurki/hex.nvim",
    "https://github.com/lukas-reineke/indent-blankline.nvim",
    "https://github.com/kevinhwang91/nvim-ufo",
    "https://github.com/kevinhwang91/promise-async",
    "https://github.com/chentoast/marks.nvim",
    "https://github.com/adriankarlen/plugin-view.nvim",
    "https://github.com/folke/trouble.nvim",
    "https://github.com/m4xshen/smartcolumn.nvim"
})

--delete buffers
require("bufdelete")

--make splits better with wezterm
require("smart-splits").setup()

--zoom in
require("simple-zoom").setup()

--hex editing
require("hex").setup()

--indent lines
require("ibl").setup{
    indent = {
        highlight = "Folded"
    },
    whitespace = {
        highlight = "Folded"
    },
    scope = {
        enabled = true,
        highlight = "Function"
    }
}

--better folds
require("ufo").setup{
    provider_selector = function(bufnr, filetype, buftpe)
        return {"treesitter", "indent"}
    end
}

--better support for marks
require("marks").setup()

--plugin viewer for new native package manager
require("plugin-view").setup()

require("trouble").setup{
    focus = true
}

require("smartcolumn").setup{
    scope = "line",
    disabled_filetypes = {"markdown", "help", "text", "netrw"}
}
