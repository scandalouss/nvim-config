return{
    "NeogitOrg/neogit",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "sindrets/diffview.nvim",
    },
    lazy=false,
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
