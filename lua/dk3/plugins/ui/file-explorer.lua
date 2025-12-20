return{
    {
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v3.x",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "MunifTanjim/nui.nvim",
            "nvim-tree/nvim-web-devicons", -- optional, but recommended
        },
        lazy = false, -- neo-tree will lazily load itself
        config = function()
            local explorer = require("neo-tree")
            explorer.setup({
                close_if_last_window = true,
                filesystem={
                    hijack_netrw_behavior = "open_current"
                },
            })
        end
    }
}
