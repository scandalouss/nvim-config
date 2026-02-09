vim.pack.add({
    "https://github.com/MeanderingProgrammer/render-markdown.nvim",
    "https://github.com/epwalsh/obsidian.nvim",
})

require("obsidian").setup({
    workspaces = {
        {
            name = "personal",
            path = "~/documents/notes"
        }
    }
})
require("render-markdown").setup()
