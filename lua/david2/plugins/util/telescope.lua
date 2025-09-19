return{
    "nvim-telescope/telescope.nvim",
    tag="0.1.8",
    dependencies={
        "nvim-lua/plenary.nvim",
        "DrKJeff16/project.nvim",
    },
    event="VeryLazy",
    config=function()
        local project=require("project")
        local telescope=require("telescope")
        project.setup{
            telescope={
                disable_file_picker=true
            }
        }
        telescope.setup{}
    end
}
