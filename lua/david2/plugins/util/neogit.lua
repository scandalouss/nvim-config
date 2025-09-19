return{
    "NeogitOrg/neogit",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "sindrets/diffview.nvim",
    },
    event="VeryLazy",
    config=function()
        local neogit=require("neogit")
        neogit.setup{
            kind = "floating",
            integrations = {
                telescope = true
            }
        }
    end
}
