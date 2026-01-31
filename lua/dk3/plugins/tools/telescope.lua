return{
    "nvim-telescope/telescope.nvim", version = "*",
    dependencies={
        "nvim-lua/plenary.nvim",
        "DrKJeff16/project.nvim",
    },
    event="VeryLazy",
    config=function()
        local telescope = require("telescope")
        local project = require("project")
        telescope.setup{}
        project.setup{
            telescope = {
                disable_file_picker = true
            }
        }
    end
}
