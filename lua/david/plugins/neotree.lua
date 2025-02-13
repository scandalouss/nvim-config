-- file explorer
return{
    "nvim-neo-tree/neo-tree.nvim",
    dependencies={
        "nvim-tree/nvim-web-devicons",
        "nvim-lua/plenary.nvim",
        "MunifTanjim/nui.nvim",
        {"3rd/image.nvim", opts={}},
    },
    event="VeryLazy",
    config=function()
        local neotree=require("neo-tree")
        neotree.setup{
            close_if_last_window=false,
            popup_border_style="single",
            filesystem={
                follow_current_file = true,
            }
        }
    end
}
