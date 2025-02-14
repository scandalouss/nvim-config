-- file explorer
return{
    "nvim-neo-tree/neo-tree.nvim",
    dependencies={
        "nvim-tree/nvim-web-devicons",
        "nvim-lua/plenary.nvim",
        "MunifTanjim/nui.nvim",
        {"3rd/image.nvim", opts={}},
    },
    lazy=false,
    config=function()
        local neotree=require("neo-tree")
        neotree.setup{

            close_if_last_window=false,
            popup_border_style="single",
            filesystem={
                hijack_netrw_behavior = "open_current",
                follow_current_file = {
                    enabled=true
                },
            },
            event_handlers={
                {
                    event = "file_open_requested",
                    handler = function()
                        vim.cmd("Neotree close")
                    end
                }
            }
        }
    end
}
